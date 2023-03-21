// 获取用户详细信息
import request from "@/utils/request";

export function addSystem(data) {
  return request({
    url: '/pc/system/add',
    method: 'post',
    data
  })
}

export function userList(query) {
  return request({
    url: '/pc/user/list',
    method: 'get',
    query: query
  })
}

export function updateSystem(data) {
  return request({
    url: '/pc/system/edit',
    method: 'post',
    data
  })
}

// 删除用户
export function delPcUser(userId) {
  return request({
    url: '/pc/user/' + userId,
    method: 'post'
  })
}

export function resetUserPwd(userId, password) {
  const data = {
    userId,
    password
  }
  return request({
    url: '/pc/user/resetPwd',
    method: 'post',
    data: data
  })
}
