<template>
  <section className="componentsTinymce_index">
    <textarea ref="textarea"></textarea>
    <div class="editor-custom-btn-container">
      <editorImage color="#1890ff" class="editor-upload-btn" @successCBK="imageSuccessCBK" />
    </div>
  </section>
</template>

<script>
export default {
  props: ['str'],
  data() {
    return {}
  },
  computed: {},
  watch: {
    str: function (val) {
      window.tinymce.activeEditor.setContent(val)
    }
  },
  components: {},
  mixins: [],
  beforeCreate() {
  },
  created() {
  },
  beforeMount() {
  },
  mounted() {
    let that = this
    let el = this.$refs['textarea']
    el.addEventListener('input', e => {
      console.log(e.target.value, e,)
    })
    window.tinymce.init({
      target: el,
      language_url: '/tinymce/langs/zh_CN.js',
      language: 'zh_CN',
      content_style:
        'p {margin: 0px; padding: 0px} body {margin:8px;font-family:arial,sans-serif;font-size:14px;}', // 初始换样式
      menubar: false, // 显示菜单栏
      height: '500px', // 高度
      fontsize_formats: '11px 12px 14px 16px 18px 24px 36px 48px',
      font_formats:
        'Arial=arial,helvetica,sans-serif;微软雅黑=Microsoft YaHei,Helvetica Neue,PingFang SC,sans-serif;苹果苹方=PingFang SC,Microsoft YaHei,sans-serif;宋体=simsun,serif;Andale Mono=andale mono,times;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Trebuchet MS=trebuchet ms,geneva;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats;',
      auto_focus: false,
      resize: false,
      placeholder: '请输入内容',
      convert_urls: false,
      // images_upload_url: '/dev-api/common/upload',
      // images_upload_base_path: '/dev-api',
      plugins:
        'table,pagebreak,charmap,emoticons,hr,lists,fullscreen,code,preview,image,imagetools,recommendedsearch,visio,form',
      // toolbar:
      //   'undo redo formatselect fontselect fontsizeselect lineheight bold italic numlist underline strikethrough forecolor backcolor table pagebreak alignleft aligncenter alignright alignjustify outdent indent blockquote removeformat image imagetools charmap emoticons hr fullscreen code preview recommendedsearch visio',
      toolbar:
        'alignleft aligncenter alignright alignjustify bold image table imagetools preview recommendedsearch visio form',
      init_instance_callback: function (editor) {
        editor.on('input', e => {
          // console.log(editor.getContent())
        })
        editor.on('blur', e => {
          console.log(editor.getContent())
          that.$emit('setStr', editor.getContent())
        })
      }
    })
  },

  activated() {
  },

  deactivated() {
  },

  beforeDestroy() {
    console.log('componentsTinymce_index组件即将销毁')
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.componentsTinymce_index {
  height: 100%;
}

.tox-dialog {
  z-index: 10000;
}

.tox-dialog--width-lg {
  z-index: 10000;
}
.editor-custom-btn-container {
  position: absolute;
  right: 4px;
  top: 4px;
  /*z-index: 2005;*/
}
.fullscreen .editor-custom-btn-container {
  z-index: 10000;
  position: fixed;
}
</style>

