// 获取用户详细信息
import request from "@/utils/request";

export function addSystem(data) {
  return request({
    url: '/pc/system/add',
    method: 'post',
    data
  })
}

export function systemList(query) {
  return request({
    url: '/pc/system/list',
    method: 'get',
    params: query
  })
}

export function systemListAll(query) {
  return request({
    url: '/pc/system/all',
    method: 'get',
    params: query
  })
}

export function updateSystem(data) {
  return request({
    url: '/pc/system/edit',
    method: 'post',
    data
  })
}

export function delSystem(systemId) {
  return request({
    url: '/pc/system/' + systemId,
    method: 'post'
  })
}
