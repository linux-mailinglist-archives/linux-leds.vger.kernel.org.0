Return-Path: <linux-leds+bounces-2212-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B505E9299D3
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 23:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53C7A1F21421
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 21:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139E757C8E;
	Sun,  7 Jul 2024 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yUf5MXcx"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE98814;
	Sun,  7 Jul 2024 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720388728; cv=none; b=R57xAlRE3i5ecwfeLitxhl8p56NBalENvGxUOSnV5ZrvbCM3aMsSF6OnUur9jkMQj3QZ1ptaXSve+AbMLqjxJA9ITLGf1yZKqlT1K6wlO3QZK94+roecNmg6pN0IEIsldO2k4Snkr2FG1O8qwvQox6RLcq7bNKIqwyj2qHUgnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720388728; c=relaxed/simple;
	bh=kxoFWYO3bwZsOtyKWt2DNQ3B10E/thQVySN+XmbBCRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foQH237pyZdQnJeUby4KFJN+yyE3YD+gAwx5wOMKotG28PFH0KmNfSwVq2QOMKqxI8+x85twpHqA8O2Yo2aUfA3V87ay80XqFab+ege9QDWQODyhY6UgrUaRseLP+BdOd8vrV+vQ7cf6xhJykFvmJsOJ8H1Y4sD4a/qJbP7UZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=yUf5MXcx; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8AA128848D;
	Sun,  7 Jul 2024 23:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720388274;
	bh=DaZTjlF90VZfbPLVFBAGhoPz840GJQhHGxpz8MMGTwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yUf5MXcxu6xkB8toruebib0gSsBnLM7VJyB1fSXq9VHPLq6DyRpN0hTygVSd0FHOl
	 buZHbdUiDFOK9Jf+pp2D8EyIF3ZJsJGGAM9eqQid8H7sAhnpgdXcJSJ0ERUqhci2+x
	 oB7i4NV4jgRWtxqEPmrL84TxQpowYRQWg4qPBbUNCkJ1/mkW9fGkTSz8BG9skM+zLf
	 17SP3qEVMM01UUTnN5u6WeCPW9RP/bYDLXndPag0VDgH38KlU1f0dV7J9zzeEZrqeG
	 F+P2g1AuEC/5YjhMEQntSN5Y89ixVZ+YUNtUco+GGpZL4k3fVl0ZKoCsA6eBG1HHPu
	 EycgpdEb6bURA==
Message-ID: <ba158821-2f9f-46f6-9929-5bc810f2e10b@denx.de>
Date: Sun, 7 Jul 2024 21:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: Document "netdev" trigger
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org
Cc: kernel@dh-electronics.com, Conor Dooley <conor+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240705215313.256963-1-marex@denx.de>
 <22b43c93-6055-4503-94ad-cd449f21f801@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <22b43c93-6055-4503-94ad-cd449f21f801@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/7/24 3:49 PM, Krzysztof Kozlowski wrote:
> On 05/07/2024 23:52, Marek Vasut wrote:
>> Document the "netdev" trigger which is used to control LEDs by
>> network device activity.
> 
> Instead, please propose a patch adding a comment there (in that place):
> "# netdev - not accepted, please do not add it"
> 
> This is like fourth or fifth attempt.
> 
> https://lore.kernel.org/all/20230217230346.GA2217008-robh@kernel.org/

There is a follow up to that discussion:

https://lore.kernel.org/all/20230221014413.GA780723-robh@kernel.org/

That netdev trigger is nothing new, there are existing DTs using that 
trigger in-tree going back to 2019, this is only documenting it.

So, shall I really add a comment or update the commit message ?

