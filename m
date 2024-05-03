Return-Path: <linux-leds+bounces-1569-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E38BA73F
	for <lists+linux-leds@lfdr.de>; Fri,  3 May 2024 08:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0252829F8
	for <lists+linux-leds@lfdr.de>; Fri,  3 May 2024 06:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C7E1465A8;
	Fri,  3 May 2024 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3zjWUJZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9D14658F
	for <linux-leds@vger.kernel.org>; Fri,  3 May 2024 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714719235; cv=none; b=KyDQPrUn5+xibgnoK7mRk3bV0GVPViYLMQfrclBxxGHY06s0fvZ5W9/nsjrLPQzLKy6BG0D5qwbyMXkKXo0wRJt8PS3CxkJx4rs8sN28wfjw34w2VtsbKq6eDW4NDDAVcO8zCP90BjSrS2OpoYOOIrg74UaVIriIceOFITLyh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714719235; c=relaxed/simple;
	bh=9r0WUT9EYmthZ0Px23pMVTicuoR4qkYxZY61kpxHnEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crporFxMZ9owpN8y0jzQQGNB+kPw+ftAv2pkerTn08VOVecx8EJonxExqV0T7ZNE1Q3gZHZlsWfdXnuaBseVjOTtrXKMBotEA1Fj0muTyzUOcHDqo3RjXm1QDk0xGT1MN+NOclEBKNLv9P7ScsN+alUbE1jVGlLmEg1UUT0HX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3zjWUJZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714719232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7SMs5qrwgQw+h/Z3nYiDsUtQBYzsBB4vdOGUtUdAGo=;
	b=R3zjWUJZP67mFh0YduRo4nF+Jj+2O9iYCWX0dvKw/Ce2mSDciSzRBUPIecETvOe009KH09
	lVjcX43hZggQX0AgANMU5LkCZ3VBNkAVc8+xMjg1TRzCsexkW3nqZ51NEFlUALQGH5P5xX
	n+mbN4gb4ggJ44yQnqMC6uSP4WXFujA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-lmyJ3r_6MIKowznQNY32IQ-1; Fri, 03 May 2024 02:53:51 -0400
X-MC-Unique: lmyJ3r_6MIKowznQNY32IQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5966e85bf6so130217166b.0
        for <linux-leds@vger.kernel.org>; Thu, 02 May 2024 23:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714719230; x=1715324030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7SMs5qrwgQw+h/Z3nYiDsUtQBYzsBB4vdOGUtUdAGo=;
        b=wDL3eVBbdwFJm6aCdfWJucnLiQmh8wTztF6syJ4bc46EnYwdMqgejJW5pai57Kdsq5
         XSClOd5PXd4QD1F8lFfYofzlqBWmfUQo+csWcdPEuCRJJq+UAupiswlNjwxAjaKO3+fw
         OuDL6ReoLD05IlyDkRldPXWDZl67APjyp+XiU5UMtgAFxV3rtByHL8m89NyL0AlhWNjk
         aR8GoD4jCOAeUEipL4PnCUDfRBrbP5nQC2i0iafZXpMN/bendo9ygz8E+CpfacXXqgkh
         a6+2TbZKOQy//kkdXKPo+9gUnD7p6IJRbn+c+PvZFYrNg6RqZkNQT4So3U1NniKH0eVl
         tljg==
X-Forwarded-Encrypted: i=1; AJvYcCVLj5QW67x1yAxrjGWhRVAyu6s6q/I08dVZz0tsL/q3pGAC/+detb07IDLFpo1WKo6KJMxku1qUjzV9N0l0Acps71Fecyi6wZEyqQ==
X-Gm-Message-State: AOJu0YwYixYfymFwpEUYf8BT8MiQ/5fvF0QA5RkjvsOnXaE9gkeS/lk3
	wwKwUnGG8XXXzlhzhRchBW16xwPfdaFdUK6PTXhcxgK+c6pfWpY5UQsMR4lBfW0VvJgyn8Uo2yf
	hrt7teKu2LOjfSxEg9QcdLl9SnVBGPDzfSTFxi3VqrEeFjFKI/+acb0c7oF4=
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr3705824edk.10.1714719230179;
        Thu, 02 May 2024 23:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvymi6HhUa9dnkw6/DSrJwRZ6pkNNf/zpRR/XL1c+d+x3RTZiDl6u19pvNSxYQYRTujaEJw==
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr3705800edk.10.1714719229715;
        Thu, 02 May 2024 23:53:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c595000000b005729337f955sm1327341edq.97.2024.05.02.23.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 23:53:49 -0700 (PDT)
Message-ID: <88d18069-3327-463e-afa6-b80645dfbb7f@redhat.com>
Date: Fri, 3 May 2024 08:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Sebastian Reichel <sre@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240502211425.8678-1-hdegoede@redhat.com>
 <20240502211425.8678-4-hdegoede@redhat.com>
 <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/3/24 5:43 AM, Andy Shevchenko wrote:
> On Fri, May 3, 2024 at 12:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The mutex must be initialized before the LED class device is registered
>> otherwise there is a race where it may get used before it is initialized:
>>
>>  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>  WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
>>  ...
>>  RIP: 0010:__mutex_lock+0x7db/0xc10
>>  ...
>>  set_brightness_delayed_set_brightness.part.0+0x17/0x60
>>  set_brightness_delayed+0xf1/0x100
>>  process_one_work+0x222/0x5a0
> 
> ...
> 
>> +       mutex_init(&chip->mutex);
> 
> devm_mutex_init() ?

That is not in Torvald's tree yet.

Regards,

Hans


