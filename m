Return-Path: <linux-leds+bounces-274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55780732C
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 15:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A8DAB20D7B
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 14:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C500E3EA83;
	Wed,  6 Dec 2023 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cy4olHDE"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4240D9A
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lI8W6CO+u1S10tMvsZNrVhiLtm/T33ov+fTqgOUmfWo=;
	b=Cy4olHDELpz4Rg28Yn8xHshnwLc3VgCviD1EiP+dS/mamQr88N+/ut2eb2ls4E0VoBgNBa
	VMSmE1ZRHN4gIPQAp2MgzQr2i0SexGNwHGwPUJcSCCPFjwO5KS2K5vQs673tV5yI7FQJQt
	z7x+xyYBLS5/hBMSzKUgmlu9knrdO4A=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-gnCwznUROEG99m81Pa66Gg-1; Wed, 06 Dec 2023 09:58:26 -0500
X-MC-Unique: gnCwznUROEG99m81Pa66Gg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c9f5bf236fso36092071fa.1
        for <linux-leds@vger.kernel.org>; Wed, 06 Dec 2023 06:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874705; x=1702479505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lI8W6CO+u1S10tMvsZNrVhiLtm/T33ov+fTqgOUmfWo=;
        b=eA7j925db4Omm0xU00MaIs6OSC6VE/5ljVf1TU3R3SVUNOFo9s8XRHvgcamfpexsdg
         XDSbk8CTqcawqR6buynpIzU68iqoPR4OuZFXW0dRCLZ4q8YfSVh9MZgg3/XlCgwON1/7
         LcsRgBwdL7kMgALYGyq+lVK+eHGWSTvXxMQpjhivVdcI1H+y5y2/eZkuYFzOS05+N5/r
         Q3D3vd8RcLoQA8Px6OeFSG8cI+9VHCPt18sliYDoZQMKIxitMAYGqBGTUdIHCdhJ1Faq
         kvB+WMnpjMBtA9MQoliZ01mGL4szOM5qnxYwbTYmtpBJ2+yYvqnWo5m8tF1PCC4O+K8g
         NgYw==
X-Gm-Message-State: AOJu0YxJnC9GM+jlGFw0o0PHmAu8S7t8b/DCoIcqR2h50BWuw0D85cyU
	zk36/o6DQsrHtsHPDq7a5D8nY3x6tJT5r0JuxAzpqHZplOAsyUNE2FDkidnAVDLlYRfhdlN35C9
	UOx7Fe4UIE75O2cFXHmCNuw==
X-Received: by 2002:a2e:879a:0:b0:2c9:f2ef:cf14 with SMTP id n26-20020a2e879a000000b002c9f2efcf14mr784401lji.67.1701874705515;
        Wed, 06 Dec 2023 06:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFAROg+Lxclo/3NuDIimFR4fm3oJ99oj3ElVJlPS5SozqYTKjUwT8fR42ApPqSVQx8pFmf9Q==
X-Received: by 2002:a2e:879a:0:b0:2c9:f2ef:cf14 with SMTP id n26-20020a2e879a000000b002c9f2efcf14mr784392lji.67.1701874705190;
        Wed, 06 Dec 2023 06:58:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id br20-20020a170906d15400b00a1dcfd8f95csm27081ejb.37.2023.12.06.06.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:58:24 -0800 (PST)
Message-ID: <6381d523-8f49-48e2-8576-b74a14eead30@redhat.com>
Date: Wed, 6 Dec 2023 15:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US, nl
To: George Stark <gnstark@salutedevices.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 jic23@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <CAHp75Vc=GAnzwhWQTifLzw8OA7Lb35hrJCDxK-RkgZnX8JmfOg@mail.gmail.com>
 <48ea90f9-922d-4a03-86da-cbb5aa9908b6@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <48ea90f9-922d-4a03-86da-cbb5aa9908b6@salutedevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/6/23 08:56, George Stark wrote:
> Hello Andy
> 
> Thanks for the review.
> 
> On 12/4/23 21:11, Andy Shevchenko wrote:
>> On Mon, Dec 4, 2023 at 8:07 PM George Stark <gnstark@salutedevices.com> wrote:
>>>
>>> Using of devm API leads to certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapping.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
>>
>> ...
>>
>> Do you need to include mutex.h?
> It's already included in linux/device.h which is included in devm-helpers. Should I include mutex.h explicitly?

Yes you must explicitly include all headers you use definitions
from. Relying on other headers to do this for you is error prone.

Regards,

Hans



