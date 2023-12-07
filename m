Return-Path: <linux-leds+bounces-306-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66100808D64
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4B1280F86
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 16:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C7346BB9;
	Thu,  7 Dec 2023 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ3seVR2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC046BB6
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 16:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B75C433C7;
	Thu,  7 Dec 2023 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701966649;
	bh=lQQtU4tYIZ245AplOqW4Zvwsb+ueZMLoO44f/yIejSk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MQ3seVR2dDL05UbmXkM8yxg6e/AANgmppkO7hfPNFLUIdFsiYjzsCeI65h+EvTxLj
	 Om4vuRDd/nQ/f6aLxNLSTfjwWYSS2d49NsLLenTvKxmNk5jxCHM/NUlwTHeTtyMnSI
	 KD5sYHsw+MhiJy0A3SoYvqTc3ozluoevgqeE5fJ4JjLaex8eDlQDrKiI7QcmJ6FsB6
	 hRpvkwM09R8KczL+U6lOwyVG3sKl+zJqNURvGVlaU05ZR2yBZWyJtvWyJNYJQUElcD
	 Z8o4PWSZ+Ll2b9hUWYZaO1Nfx8FKbU1vY46+FLH+jFE4VlRNAj9rv5xVOZfeSwn/40
	 XL2eSZRLbwpJQ==
Date: Thu, 7 Dec 2023 17:30:44 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, Li Zetao
 <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/2] docs: ABI: sysfs-class-led-trigger-netdev: add
 new modes and entry
Message-ID: <20231207173044.67ec3c9d@dellmb>
In-Reply-To: <e72a6794639cf3881d698e1d34b456e747da1b95.1701143925.git.daniel@makrotopia.org>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<e72a6794639cf3881d698e1d34b456e747da1b95.1701143925.git.daniel@makrotopia.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 04:00:39 +0000
Daniel Golle <daniel@makrotopia.org> wrote:

> Document newly introduced modes for the LED netdev trigger.
> 
> Add documentation for new modes:
> - link_2500
> - link_5000
> - link_10000
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: include this documentation patch as well
> 
>  .../testing/sysfs-class-led-trigger-netdev    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> index f6d9d72ce77b7..a6c307c4befa0 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> @@ -114,6 +114,45 @@ Description:
>  		speed of 1000Mbps of the named network device.
>  		Setting this value also immediately changes the LED state.
>  
> +What:		/sys/class/leds/<led>/link_2500
> +Date:		Nov 2023
> +KernelVersion:	6.8
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Signal the link speed state of 2500Mbps of the named network device.

Should this file be present even if the network device does not support
that speed?

Marek

