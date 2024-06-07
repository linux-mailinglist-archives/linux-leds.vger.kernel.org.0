Return-Path: <linux-leds+bounces-1858-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1E90008D
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 12:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF681F24636
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 10:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69D015CD41;
	Fri,  7 Jun 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfDtFfM2"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEC13CABA
	for <linux-leds@vger.kernel.org>; Fri,  7 Jun 2024 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755602; cv=none; b=i5IW0ZXUKJheW7zgtXepulBlVsaYHaBJeaSTq0nUQvsE2TARiY+Pq+xG2mHEDCDsDq8CUsKVsXSMjxjTu2WLNpWQBpoXLT20GoHgBhov7DzvsIDcXHVnCbk0FoIG/aanwj6/bY7fR8iWxEMl3ZiabqztUNDCGWGr+shIBynevlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755602; c=relaxed/simple;
	bh=vTEZCukUMXcbXJO9IWA8dOisP930Ku2NFFH6hnITE2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXqWU01hozoU1Qi3y8eA1k/gmLL6kPizbsI0CbyTqniJgN3dS+znDYelkf6HYf6jZoDil4za/IVwQj6YIeJXw3drARVJMdh6kB5F9kS5n8YH5GtYADanC7fQ6LiCBPkl4SUCvYaVFtkOMpFTC3D5uyE42cstAgDT3xu0D18XkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfDtFfM2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717755600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/k0UOD2XzT93LwcNZDcZVp/aAS4aZSAyvm1MCnMlto=;
	b=PfDtFfM2eG+cuDutfDMP6KR7ZkH5nt6fQIE4Nptr7BcITM0+QIjW4MbQ/9mWWQdq4ZsiIo
	oRe6Ot2HC+7z8ToHKybl4xOg5OZXwMY0nwrfwwik1hnytlAoXX5+oxYzfB1FULWfcIJY7z
	JAPrlR4l+swxMPzhD3pQcd14h/tPpcE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-YXlYgXDbNrCnWyR0ayFsqw-1; Fri, 07 Jun 2024 06:19:59 -0400
X-MC-Unique: YXlYgXDbNrCnWyR0ayFsqw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6912c4ddb1so105494766b.1
        for <linux-leds@vger.kernel.org>; Fri, 07 Jun 2024 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717755598; x=1718360398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/k0UOD2XzT93LwcNZDcZVp/aAS4aZSAyvm1MCnMlto=;
        b=jxquWbRcK6hofDOGxUyswD8IJOpU/nmE8JVccDFT8s6Y6eCbTUezNoHprGz6mqWUYP
         pFVzO3B+F1G/8igZyjatUBzuLW5D32iTIJ+Nz3MUR3BXILSgSBzPbhxWg/t3aiBxmtqh
         +xF8gnBMQzvrqcT9+M4n7oDzebNhQUDc3O79TYGZevQKJjMyurgqPP+0G+7S+aDXWX2F
         jT2Yt3+EQnnUMcsjunFlgT8a+twWwLuu4LMYfwO0FRQHdkf+8pdH4cX51iJubxjJyFoi
         TWnbDQmBRA5+ZEIq4FrOHW61L2dyDsW+tIM90W/mM7MwH0j2fum5aKC06TTlDmrsO4jf
         0kQg==
X-Forwarded-Encrypted: i=1; AJvYcCXJrIfY/ovpMoWMKW2V3/BXhgMB3eCqb+TvXOdCMnP52tQQDFYayzGOQK8POjtk73G/BrN2Eoh9YsT4BLgwuGGtpSQ36DC6E2mgfg==
X-Gm-Message-State: AOJu0Yy6X9iutA77Wai8o/06YDpV9tkNvFEye/8pTTJP1YqIM60iuHHG
	kzp1hY+98QZTQnvHFCI5gILHxxXVrKCS36l8BYDVBf21Rku99mw7NNpM+heHQnzWiqK0/GLBBju
	EGepmTD3E0agiOVEC+Bnv1rEJ8nmT4Rekg34ewYf4ywkNAE0aWClZq2/AzVo=
X-Received: by 2002:a17:906:1115:b0:a68:c6e5:3574 with SMTP id a640c23a62f3a-a6cdc0e40cemr136189966b.75.1717755597982;
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpxxlwVPDRCJiZJv2Ua4GosyAN37/Sah9MwXT24eqOxTcjruBidwO3ep0dAi45T+RHQ8P8dQ==
X-Received: by 2002:a17:906:1115:b0:a68:c6e5:3574 with SMTP id a640c23a62f3a-a6cdc0e40cemr136188466b.75.1717755597601;
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaedesm223566166b.119.2024.06.07.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
Message-ID: <5d037003-a90b-4607-8eb6-6fdd5824e373@redhat.com>
Date: Fri, 7 Jun 2024 12:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
 <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
 <20240606063902.776794d4@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240606063902.776794d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/6/24 3:39 PM, Jakub Kicinski wrote:
> On Thu, 6 Jun 2024 15:12:54 +0200 Andrew Lunn wrote:
>>> So it has been almost a week and no reply from Heiner. Since this is
>>> causing real issues for users out there I think a revert of 66601a29bb23
>>> should be submitted to Linus and then backported to the stable kernels.
>>> to fix the immediate issue at hand.  
>>
>> Agreed.
> 
> Please submit..

Done: https://lore.kernel.org/linux-leds/20240607101847.23037-1-hdegoede@redhat.com/

Regards,

Hans





