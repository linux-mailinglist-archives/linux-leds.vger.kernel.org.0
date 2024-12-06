Return-Path: <linux-leds+bounces-3506-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2DB9E77C8
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 19:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88EA281C2F
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160341F4E20;
	Fri,  6 Dec 2024 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pppjbmu3"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74A02206A5;
	Fri,  6 Dec 2024 18:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733508163; cv=none; b=nkf3ufB/RPar/28476g1fjXtEPhgZzeTeLt30++uxDCgapzCMSPRjRVWa8UeMke5qqXtaXYF5pKLemtlvt/H0tXuIdbZCEava6XixHdvPENs1wX0w7M5QcYJqtvQvnqUcXAqT8N0mZiUOXx3vKSjQuqQAc1MWOEdKfv7EYXgHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733508163; c=relaxed/simple;
	bh=GqPKbILJz1hkE4TVnKaZUB7g2QlHy4l2n9/flgVAakA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mXorUFOrXqJW/C9J8hjpH1wHgZttIEFNR68l101EyXt/TG05i0AZTFgqFhZeLl8PFr2kWAhae1sJBgULmQtoZtuO4MnLu9x1kg1GEQsCAwJj/d5YnJkgOj9OWGBNTqeXMTr0oKlcTCg9ryw7WFpDoulvi4MFQ7IeFvT7scMwIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pppjbmu3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6I2HF52394970
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 12:02:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733508137;
	bh=AB7rvt8lEDFwJ8EFWXm4qm+/wdw4f6cHzb/xxrpxAas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pppjbmu3TH0G3sPdDbHHVTipbIxzBMGBaOVTUtftpzsLbkyVI1fy8TsuSaWZPuiNH
	 +uZGZAEwmzi+HyeAnvwdH/t5XRZeYzGjUTz6WKGcT/W9dEYrc7SsuvzRZAcPle1aQO
	 ltm9DJVEFRwdLIPENozc4c6ENCE1T5o9wnoADPr8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6I2HAL032754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2024 12:02:17 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 12:02:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 12:02:17 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6I2GXk113376;
	Fri, 6 Dec 2024 12:02:16 -0600
Message-ID: <fa2c0961-771d-4a71-8dea-b7a3cdea6ced@ti.com>
Date: Fri, 6 Dec 2024 12:02:16 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
        "conor@kernel.org"
	<conor@kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "dmurphy@ti.com"
	<dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "danielt@kernel.org"
	<danielt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
 <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
 <1b8648f10248a949508240785f5a99ed7c2c2037.camel@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1b8648f10248a949508240785f5a99ed7c2c2037.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/6/24 11:46 AM, Sverdlin, Alexander wrote:
> Hi Andrew,
> 
> On Fri, 2024-12-06 at 11:43 -0600, Andrew Davis wrote:
>>> Are you sure this is a correct thing to do? The lp8860-q1 product link
>>> cites it as being a 4-channel device. Even if the kernel only ever
>>> supports it as a single-channel device, the binding should reflect what
>>> it is capable of doing.
>>>
>>
>> Agree, the driver today just checks the first child node, but it could
>> be extended for all 4 supported LED channels, and we shouldn't have
>> to change the binding for that new support.
> 
> but the channels are (in my understanding) for power-balancing only, there
> are no separate controls for them. What do I miss?
> 

I'm not very familiar with this part either, but looking at the datasheet
I see:

> Supports Display Mode (Global Dimming) and
> Cluster Mode (Independent Dimming)

> In Cluster mode LED strings have independent control but fewer features enabled than in Display Mode.

And one channel controlling the others is only in this "Display Mode",
but the currents to the others can be independently controlled in a
different mode (seems these modes have less features which is probably
why the driver doesn't make use of that today).

Andrew

