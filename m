Return-Path: <linux-leds+bounces-228-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5456E80092C
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1EBCB20BFC
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADB3208A9;
	Fri,  1 Dec 2023 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ74a4JS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5811F934
	for <linux-leds@vger.kernel.org>; Fri,  1 Dec 2023 10:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B76DC433C9;
	Fri,  1 Dec 2023 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701428263;
	bh=nC5xwZOy6zOgP7UJLi8bxNzdziURwOB3M+M55ko464o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qZ74a4JSdFhYHbnXUY9rvXzrtMS2ND/zW4h6kY+mHE46AopMYHwgzOZf0cX2JnF6t
	 Ybil6aBlofhZlgagSad96RcZu0nib6g9u9IaXK6RA4n+tAdsj282XvAPX40nvHW97O
	 zhAVbOQu9Ddzup6vb6OTOHx8G7kmk8G0NZXyHdXUgRZPQdH10I/leSuud8rT3WYPju
	 +DQDsIc87vDRGsmThhH2Db7+DCwXD3k2MD8xFGxoBAtx6G8/yoeOQjpVj+sNBKFjv7
	 StfbjcC6tF4U7mkZyH6ASkeZW3st7twPjnbNVzxanO9DezUvGeZc6GjV6fmQkFK12O
	 pDzGEH6ITKObg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Li Zetao <lizetao1@huawei.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-Id: <170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 10:57:41 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 28 Nov 2023 04:00:10 +0000, Daniel Golle wrote:
> Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> 
> 

Applied, thanks!

[1/2] leds: trigger: netdev: extend speeds up to 10G
      commit: bc8e1da69a68d9871773b657d18400a7941cbdef
[2/2] docs: ABI: sysfs-class-led-trigger-netdev: add new modes and entry
      commit: f07894d3b384344c43be1bcf61ef8e2fded0efe5

--
Lee Jones [李琼斯]


