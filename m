Return-Path: <linux-leds+bounces-8778-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6QEWMXJ3QmqV7wkAu9opvQ
	(envelope-from <linux-leds+bounces-8778-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:47:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085B6DB7B8
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:47:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oqDQdMo7;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8778-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8778-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82CDD301FF8A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE72F21CC51;
	Mon, 29 Jun 2026 13:40:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C1218821
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 13:40:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740427; cv=none; b=O9R7RHIfyboVTnU8BpR+PR5RSnsPZEpgDHr6FARb4y9NEWITzR77x2buuEs3/UsGszvjzYwtBQTEYmfQ5SsqGDhPU81rE/BduaoqQSWz9mPHYYB89MlMwfh4sAqpz5Lbu/l3CjxmfRC2/xsDbSP6MYV1lWuNMCM2nzECIBjMn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740427; c=relaxed/simple;
	bh=jQhPNikCLFX4aqzB4C1+S0WA2gryD4jcToyA0jONtOk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uiE4JfMzqXcX7jBEuXV9XS/twme/DM2GS6oj3rWKO8MFc/cJvdvOyWQmWJefSCse8gnyBrsZg6Du7XsU4OYOPJIUJTFFhK6+6zCbBCUuwNENlkyhUFKVm0CmBs78POpWnYajj6U/KI9RWyxKDgEZGe/3QcREYw+1kksRWkOa6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqDQdMo7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3AE1F00A3D
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740426;
	bh=dWdlr26Kfs/ahO6K+kk8aoFsE4SSI5ytweuNJUqCaA4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=oqDQdMo790z06ApeDSsvY3m+Y8IZ4VZoMJkJhGr7E/IjZKx64O22KSnF3+xUuRO3f
	 yvH5ym4dczIjGKrdczIpYfPoLBBOcsxNrSj6h91hZ+c5LvwtiryvUwTame1uNn9Rrr
	 WyUON5JVM6X2M7HXjlu9dCFHaih+ML2mRji8q5NmqYxEhmCp7jscP8v8CkZYNWd2dr
	 xhd1FM87CLb5bUe65OvOAO6e+bbCfwR/aLNQ4BOFjJCR1+oo0E91peSLwfYNysxn6M
	 wnQNp12CKUcvYWs6JX5HamOMDo/C2BRDOWvmsuEXyiewWafhXqE043sHdG1WMky78y
	 KaEDaoyncHfiw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D29C2F40082;
	Mon, 29 Jun 2026 09:40:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 09:40:25 -0400
X-ME-Sender: <xms:yXVCaqTbmNV0Ocsbi3MiYcHRKYhpvFInovQSIcVzW4aSqrKvIqBTqA>
    <xme:yXVCaqmwKdZ8oNS0C-fH7M42ECYZKV4alZpGL3GmVldj8p_putY0zAe8RCjmNl0qy
    7MdjF2NtLcrJX9Zty2ZEv2GkE8fV_dQwsNFYkJrS5eVcwufs8JmlN8>
X-ME-Proxy-Cause: dmFkZTEwyiikSuk+z/VB2qVPcN1EQyPqA6WOQ+eFtbmbh6SYaSdz7rkBD37IEwyRDxtGET
    RORijbLfntwSPyFj2YhZEbxd60mXyZA33VmqxImL2DoUQeJH8Eez29TcwFZHYq7GR2yV8n
    jbsxVBlwdvYKEdKvg4ZKi13qW9ThkVZs47boS3WbARwM/E1OWlqRoBErtwtlNJ0R5Uqnf5
    Ixe+uJJEcddGGI76MWMTE7QWmZJQ2j5h0IUaySJvyy84KFVeoRG+xobECdL/BEBMIBJvIT
    vvY6jpAUWxFgibIpez0dkLzhr8JwreXhzf6N1if0Mv2I7aoOfRViYHOgo9xDeKDSfmqrc0
    iSlhQqoz6k6wqeTYy8PI8zx9YYZoGli25qI5RoAZ9tzJMdOUnNzoyCkLokZBZfjKqlbNqR
    8j3uP77Efk1N4TXDZEWVo7BItO+J552OgM7xc6prSeMBikR6t2ddmjg+T6biUzS1XWSu4S
    4PcVHPkg8tRLcS/eCNibn88VZvhoDLTuaWX7QXF0biINHZ+F3b9TfBXbIb4aPtOyxSdotP
    qbNmWSaBBWDJPeIdSBTMRv6j/08rtOZp8IH64RAJQZ+gZewcT/PCfpZ/bHKYrB18Hn+hCr
    Iv4R6tKJCY5qX7ooutrYvIU/31SA7G6i2L1cdcDk33vL2efgRtjoMq97UFkw
X-ME-Proxy: <xmx:yXVCaqGLZ7a_ubFF8qrTqVbrGwPFfuMVpLR-5CfGuI5xSeza9pfh8g>
    <xmx:yXVCavBaZv_7HKQWWQc2DasrcPJ_MpRaBpq30e-wks5YaCGT2jgoBg>
    <xmx:yXVCat-yS_JmvaCQWG43ZK77Ibz1kVbVOPYfziquS-IFE29vFzG8gA>
    <xmx:yXVCarDycFjyNgzu1oaDZy2xwjgo5EqF_218TDHGfdUA1t7zXHr0rQ>
    <xmx:yXVCaiRE1-L6e8AeNrtefGl_UH4vIxTubMIBuY-EMoTtnpnVfXwTKTmZ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0AEA1820082; Mon, 29 Jun 2026 09:40:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AwEGTrxsrqWN
Date: Mon, 29 Jun 2026 15:40:04 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, "Lee Jones" <lee@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org
Message-Id: <8dc0efb2-4e16-4fc8-943e-8043713ce2fa@app.fastmail.com>
In-Reply-To: <20260629132505.A53EB1F000E9@smtp.kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-3-arnd@kernel.org>
 <20260629132505.A53EB1F000E9@smtp.kernel.org>
Subject: Re: [PATCH 2/6] [v5] x86/olpc: select GPIOLIB_LEGACY
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8778-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-input@vger.kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6085B6DB7B8

On Mon, Jun 29, 2026, at 15:25, sashiko-bot@kernel.org wrote:
>> diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/olpc/olpc-xo1-sci.c
>> index 30751b42d54ef..a5b47960ba32e 100644
>> --- a/arch/x86/platform/olpc/olpc-xo1-sci.c
>> +++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
>> @@ -9,7 +9,7 @@
>>  
>>  #include <linux/cs5535.h>
>>  #include <linux/device.h>
>> -#include <linux/gpio.h>
>> +#include <linux/gpio/legacy.h>
>
> [Severity: Low]
> Does this cause a build failure when setup_ec_sci() and other functions in
> this file are compiled? It appears include/linux/gpio/legacy.h does not exist
> in the tree, and the legacy GPIO APIs might still be declared directly in
> include/linux/gpio.h.

The header was added in 7.2-rc1.

     Arnd

