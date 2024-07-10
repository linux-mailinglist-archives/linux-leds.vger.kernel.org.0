Return-Path: <linux-leds+bounces-2246-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE792D805
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 20:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7961F23AC4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 18:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E231419580F;
	Wed, 10 Jul 2024 18:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Yt1bmhFR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31F195804;
	Wed, 10 Jul 2024 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720635036; cv=none; b=QH6G3dtjJphpGIsSmjEouILlMhEOw5exE5DBsP399SkxkdbH7MtCpDKzp95crn/69Lb6LB0uZa1LUv+j4ny8awgJvGId1dKp1OCheOeU1bm50vYeA9pOw2ruls6hT7cwIF7jigftG9i9oO0lsli2bljWGgId8qUVlG1ShICkQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720635036; c=relaxed/simple;
	bh=SwSaCHdtrV0ysbFH+TeNCysgd5A2WJZwnuYrUg5e1uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ol94Tc07/DfvNzOPx6H2IO8TGvj/sN00kiJUhg+byfeJkrCm9vD+D8GQUff4sHFt24eiNT0rgvaqdbrsiuYL2FWYbLmbya04aE7zcB81nAOkDswJWa4AplyHG32TQuht4vvuzq1qTDZXxEdASlTRnRcndyf/ygf9GgBIAaC4DZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Yt1bmhFR; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720635008; x=1721239808; i=markus.elfring@web.de;
	bh=SwSaCHdtrV0ysbFH+TeNCysgd5A2WJZwnuYrUg5e1uo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Yt1bmhFRE0sJRZnT21Kuq0DjWvRplaGG8BhbLt1N5KJLGDJ2ozxaEgeu4fmsjeFZ
	 N5q6lqemHV+eZlbjwvKosy4920fD4v+XAEeACyP2ElTBKufnS9C89J2HOtTtJB0cp
	 3ug5eE07KctxYJKwnexgI/Y7kEWUiaCSAj6Ian0rnCLONjnMp5FR2uBnt0jqJrhYU
	 lSkdU2bUJUJqFtrckuVv5Lux8LP/DyIexqmL4iAWOgHOc2hNpW9q2KSeUpxWeWre/
	 T8AREgS3OT9EbTHbdXum7SlDVMswaB7OrX95LR0gO3xzbKmkKaSo7ZkSjhbK5oZNG
	 LGXP/WyWflaCCs+W2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6bD0-1sJBmA0uL8-013stn; Wed, 10
 Jul 2024 20:10:08 +0200
Message-ID: <f33d44a1-7100-46f8-8d31-942237e61d90@web.de>
Date: Wed, 10 Jul 2024 20:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
To: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
 <20240710165528.GH501857@google.com>
 <668ebf50.050a0220.4aa0d.31b3@mx.google.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <668ebf50.050a0220.4aa0d.31b3@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cfGRNW5EkVW/03TmD4VvZcXD4vFVtNRqFplmYOp5/RZtiL+LlZw
 eEd3Ol7Eqm5gyBQyDAwqIadwLn99BCvz+nhU8aR7zUMXkpnKvJ9if9oMdEjTNVy1NMJv6Ku
 gaF2GyflCcIcRaC71/NCTImzrajk3UYNb7CWUukGoPgjDvucwsBIS0AmuFB6mVZIDcn+PUP
 3t/GUV62nABwEJXcVyEVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8K92NhQMigY=;Q2EC19q7SUWE0VO8/APvhdnUMK2
 iuhChihQl9DGictp2cjUOxZGCIY42pmxosNHM5VEej9wXuiYcoxRPCjlCSBJGWe/9MF+aNRCs
 MA1YsfStvhpYxpgDHjjJB++Ac/kobZVJpXxz0EesbWFdOp6rn/uAfGvtt6MP2mR1XVx3iyuwJ
 cQmgPqP9+bq2hv6MleSZ36cg4ojHCoDGuLDO4p0OUdgt/48NY2AtqE8JypoS4ZnxoxRg9Kn42
 +gzjcF8U9kvGt4iFKbY+uJfeIOHMa91ugp8m8iwSDuVPMzlU2sBj5Zj1VVPpauKVd2CPoZsFp
 hZxOBqyx52iRwYjQTCG9Z1dDnDeUSV5TrIT9zNvDyRKmuxzcl5LYyzObkgUcffZEhbv/FrZRO
 iMjnXaRa6hEORxQgeqb+dVP3Dxzn92NCdnxSJHSyQU8VhHpoche9Gu8L4xQ+RIY6l1I3/Rtd8
 Q79veAo9wktE/kalSgof1B3w2ahR+XRApZdc8kOF/A8n5KnEdHzUYu94nXEVqOp933cF9ZvIP
 w0400BdsVgDZ3v2HhQVJ4/F+6f90dpobxXKNpC4EchMNZl7eUA0dPOEpGTttE2inv4eHfku5g
 Tx3+CFZWINZaehd5X7k5cHyYflsXqMv3xmsfNzalCxZ+N01sNrKtY5+t85RA54j0mYZcL+Y4D
 vAyKMsU9knJh+X0VNplfZoue9w8uQzw/KNQxowdefjpGh1U88z19+3FHC+4DczFbFOf/8b0xy
 L84fbE6NRZ6Q6W0aMM5YmzrFy4y6UpdoeLfgBiUmBDqJt3IvhayGq1mdbxjNkqEAnddScrRTf
 3DJRhOwSptdVaRibvtLBHHCA==

> What is the next step?

I hope that you would dare to offer a subsequent improved patch version.

Regards,
Markus

