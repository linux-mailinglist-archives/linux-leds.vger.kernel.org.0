Return-Path: <linux-leds+bounces-6609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B0D0C71C
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 23:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B784A3005316
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 22:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133352ED846;
	Fri,  9 Jan 2026 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="YvcTmIXA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A32FFDEC
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767997177; cv=none; b=CfjvuHnfb6cIW2Rg11uVCVYrUR7fUP+iLpG89I6cfaZ0Giv5HQOHnj+I8k4Aa4Crf+TczUS+xIxLGzJILOJ0sWRsz0xg5qbQ6Ew0P+hHqgtEVp5hdRwHiyW5b/d6YBuHS7nujE2XNB1azXWn6HoMDbyYHUJApfFla1LlTIQE7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767997177; c=relaxed/simple;
	bh=wAo3z1z3zdBYsOcX/CfnKwfPV07i2rMNRWjkn2+cbDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=X1FwoyhwLAlEsvzKLmIaQaLjM9cZrS3mDcXRe8Bs3h1KKld25bQbZPp7sWeGoMgqdAmAN82UC5BVmEJkJrkQ4iTcVxg/ZLY06kIwxa8k47Su3aDElH5xvz7tt4e8TWyhG2iptt141V/OM1XBQEZ/8J32I4Ymt3cR7BLnqjnXbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=YvcTmIXA; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CBFBC240028
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 23:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1767997166; bh=FQ4K43swEw00Pp6Zmi5GCBqB678ORo+/YP3AgFeu4Q8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:
	 Content-Transfer-Encoding:From;
	b=YvcTmIXAoy+6S9lZmNmKff4bwz//Yfj40G4ud5DfWxtA5ftxQDVugOO3lcXBVaKlZ
	 FmhNrmBo/Br+m8ICCbauQiLk0uVwQCIfkdNCqEG4YO+mlx99mpgpifHtpSpyisvBkF
	 +pxt2qcjTyvMNnZyoClg+c+ukFigYhMQV0oL0UgYr3pwLXb+Td3KoHMjGdxHNs9f4w
	 CyaEP60Ut9VJKFSzyVX90KAy/RaO23E+BTTdT5ui91bLZc52mWbe+KTYARyCfF0GVN
	 WUswlg6wb7ogN9z5ahnmXi6VkDnhQSt3UBz5u8FbRPQOOwJ7lHFzmkOXwqy46OfEK/
	 wct5kyYIhSbYQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dnx5V3bTWz9rxL
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 23:19:26 +0100 (CET)
Received: from sohn-tb.zuhause.xx ([192.168.50.8]:43852)
	by server.zuhause.xx with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <ogerhabenschichten@posteo.net>)
	id 1veKnL-000000073nb-1zfp
	for linux-leds@vger.kernel.org;
	Fri, 09 Jan 2026 23:17:23 +0100
Message-ID: <cc399d9a-1470-494a-a9f9-8f0516a58800@posteo.net>
Date: Fri, 09 Jan 2026 22:19:26 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Stefan_K=C3=BChn?= <ogerhabenschichten@posteo.net>
Subject: /sys/class/leds missing since kernel 6.18 on PC Engines APU
To: linux-leds@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EU-GDPR-Delete-Code: 

Dear maintainers,

I have recently updated my APU3 system from PC Engines [1] to the 
current kernel version 6.18.

It came to my attention that the prior working directories in 
/sys/class/leds to control the three onboard LED are now missing. 
Earlier kernel versions (< 6.18) were fine. As a result the default 
parameters of the BIOS are set with one LED leaving as power indicator.

Unfortunately, the kernel messages show no errors. And the kernel config 
is the same except the new options when running "make oldconfig".

Because I am unsure whether it is may be connected to the "APU Board 
Driver" I send a copy the the responsible maintainer "Enrico Weigelt", 
too. Please let me know, if you need debug information or want me to 
test kernel patches.

In the meantime Enrico Weigelt suggested the following commit in the 
kernel tree ("platform/x86: pcengines-apuv2: Use static device properties"):

b8754092dfed4fc2fcdb0de32a029ba8f9b464b6 [2]

Thank you for your attention.

Greetings
Stefan Kühn

[1] = https://www.apu-board.de/produkte/apu3e4.html
[2] = 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b8754092dfed4fc2fcdb0de32a029ba8f9b464b6

