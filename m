Return-Path: <linux-leds+bounces-6973-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K52JRYKmmlWYAMAu9opvQ
	(envelope-from <linux-leds+bounces-6973-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 20:40:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B116DB0A
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 20:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FD6F300A139
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 19:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BE5304BDF;
	Sat, 21 Feb 2026 19:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pym+SHUk"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAE1F8AC5;
	Sat, 21 Feb 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771702803; cv=none; b=RShddJKXRF+P7lsHKtx2oGuZVUFK7x9jqvMVC7DOOgc/SAZb6pHguarTvar3DBFkqP7N4pH7eLwek8IlYj1gddGzkNcsGakFnH1Oz0zsUqfi8iPg/+i1IVQHPI5xEAob/2oy90Bo4ezei4fHbwCcyQjKJ0T1iL2yODctflpc/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771702803; c=relaxed/simple;
	bh=6877EAml+cwDVu5bMwWkpPQnqhATORdE0XORtYeXh7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPl9K02RuzBVVVoGSYXHVGOzliukS5WWTfGwTOsq8q6o7vQxQ9HahD9FUduMLme3YUUg/H9I3314IHj0TzSKfl7nKL8zGU02Lky7chmBNgQxVwoaoWI1gzlo3RKussBCA8YR43lFmpwcJIUvWqeSg+zzZXI30gHuo+x89qupqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pym+SHUk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6MPC/BjfmZ12DMeW9WRa7gVUTSve3+iuCGJFtp88j8w=; b=pym+SHUkcKaKS9RcUKno3A2+uk
	bwfJcYTNyPFxeYhBM8C0unUIXCGX2m1mrKpnFxsI7mjxLbu+uzlPzm8xOv5GaaNAM2ScX5HI62zvO
	YXFRgFqE2R2wqD8vMm6TVPk8e0dMJWNvutivXq0F8r+qfRF0jmDThJ7eOb5LYvixNkFk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtspZ-008CPG-KV; Sat, 21 Feb 2026 20:39:57 +0100
Date: Sat, 21 Feb 2026 20:39:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [BUG] AB-BA deadlock between net and led-trigger module
Message-ID: <13fd89d2-012b-4882-8a72-aa5f66460201@lunn.ch>
References: <OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6973-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F17B116DB0A
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 06:01:46PM +0800, Shiji Yang wrote:
> The OpenWrt community reports that sometimes devices fail to start[1]
> on 5.15 kernel. After further tracking, this is caused by a AB-BA
> deadlock which can be reproduced in at least 5.15, 6.6, 6.12 and latest
> 6.18 LTS kenrel.

Thanks for the bug report. I will take a look at this.

I was initially assuming this was the netdev trigger causing the
deadlock. However:
 
> Stack tracing on 6.12 kernel:
> ```
> Task1 "netifd" is used to start/restart the network:
> 
> [ 1361.967916] task:netifd          state:D stack:0     pid:4743  tgid:4743  ppid:1      flags:0x08100000
> [ 1361.977269] Stack : 00000001 00000001 00000006 800bf464 817a0cb0 800b67ac 00000001 83261b20
> [ 1361.985668]         83261a54 00000000 83261aac 000007ef 00000000 80c04d74 00000000 00000002
> [ 1361.994138]         83aba760 80ce0000 83261af8 00000002 83261af8 80cd0000 00000002 80d8058c
> [ 1362.002582]         80cc0000 809bae70 00000002 80d80000 80cd0000 80d80568 00000001 00000000
> [ 1362.011033]         809baecc 83261af8 00000002 80d80560 80d80568 809bb11c 809c09c8 806614d0
> [ 1362.019484]         ...
> [ 1362.021942] Call Trace:
> [ 1362.024380] [<809ba6fc>] __schedule+0x504/0xc28
> [ 1362.028974] [<809bae70>] schedule+0x50/0x190
> [ 1362.033251] [<809bb11c>] schedule_preempt_disabled+0x1c/0x34
> [ 1362.038958] [<809c0b94>] rwsem_down_write_slowpath+0x240/0x7f8
> [ 1362.044789] [<809c11c0>] down_write+0x74/0x90
> [ 1362.049207] [<8054e4b8>] led_trigger_register+0x5c/0x1fc		<-- Trying to get lock "triggers_list_lock" via down_write(&triggers_list_lock);
> [ 1362.054536] [<80662830>] phy_led_triggers_register+0xd0/0x234

This is the code in drivers/net/phy/phy_led_triggers.c.

> Task2 "led" is used to set the led-trigger "netdev" for a GPIO LED:

If you are using the led-trigger netdev, do you even need
phy_led_triggers.c? As a workaround, could you disable
CONFIG_LED_TRIGGER_PHY?

I'm not sure familiar with phy_led_triggers.c, so i don't have a quick
real fix.

     Andrew

