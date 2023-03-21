import request from "@/utils/request";

export function addModule(data) {
  return request({
    url: '/pc/module/add',
    method: 'post',
    data
  })
}

export function moduleList(query) {
  return request({
    url: '/pc/module/list',
    method: 'get',
    params: query
  })
}

export function updateModule(data) {
  return request({
    url: '/pc/module/edit',
    method: 'post',
    data
  })
}

// export function delModule(moduleId) {
//   return request({
//     url: '/pc/module/' + moduleId,
//     method: 'post'
//   })
// }

export function delModule(moduleId) {
  return request({
    url: '/pc/module/' + moduleId,
    method: 'delete'
  })
}

