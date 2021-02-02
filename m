Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10630BC16
	for <lists+linux-leds@lfdr.de>; Tue,  2 Feb 2021 11:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBBKev (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Feb 2021 05:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229570AbhBBKer (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Feb 2021 05:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612261995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C6EnQJADAEP2un65IiO+7dRtagMmN96hqQ78sKe3a4Q=;
        b=FntAkiX3mx6zZOEmSXrqm280k+0nOg7UYJoZ+Y6EjEzAJSGP7Q83SKM8EIbrpyZ94K5t6G
        o4GdL80lJxZuDGIxpyMXn6tiAfNIMFtbMG9q1zsINNJlNvYc+LTqDF38yLbkCsJMtUqtQX
        uEu95WrsX7c4wyuUzvcMrtfK21R5GMM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-RlFpsbb3Pn6tgnM_rjtyCA-1; Tue, 02 Feb 2021 05:33:13 -0500
X-MC-Unique: RlFpsbb3Pn6tgnM_rjtyCA-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so9768866ejb.19
        for <linux-leds@vger.kernel.org>; Tue, 02 Feb 2021 02:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C6EnQJADAEP2un65IiO+7dRtagMmN96hqQ78sKe3a4Q=;
        b=Nw84+S+B8J7LR6E34f9Ugx2XnIYiCgPD1OeCuuIS/t/nrUqbg5cC6ilV4oZC22nuXk
         FgVPoXyt0jcBkzU93TfUF8/7RhiwNZU0Gk0yZQ9pdhapZVi7r4xU6k/fRVnCpD2P8R1M
         FgbZx33Xsf88miMV6Y4bGat3ngqoCRUtsarHoB4HK75LOanNLfAw9vIgdJy6+s3Cz6Un
         XsP7iHUqEb3STQJlkwYHmvA4xPa3mKCcNa9QydE9kwmImNP8G8c7WGWlky8qJImBObs8
         BoJTbHEiczHw//RKel1MAFfMfHrGlnGf4NuVHXOoL/qfT0lWuR6Z4S+gItQEPwqxT3f/
         wXkQ==
X-Gm-Message-State: AOAM530ItXev7KaL7jOO0Xu1D6RwCX6RqaNEkNyiVeVi/0C4iuoOskYm
        OGha/M38LPamTUYSbmMEw94chio22nUA3MUwVHvZHmrMP7eo+RWMP1BolPc1In1JZvtwfMTaX5l
        k/N03mbDQNARoJJujXMgaLg==
X-Received: by 2002:aa7:d817:: with SMTP id v23mr244382edq.192.1612261992222;
        Tue, 02 Feb 2021 02:33:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO7SkdS0Kh/9ftpeXXLbdVTYwB8pnZ9oCQOs4Xht2tgKobWoIStyU859GpT+RaJFXfaPRYWA==
X-Received: by 2002:aa7:d817:: with SMTP id v23mr244371edq.192.1612261992084;
        Tue, 02 Feb 2021 02:33:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x17sm9690450edd.76.2021.02.02.02.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 02:33:11 -0800 (PST)
Subject: Re: 5.11 new lockdep warning related to led-class code (also may
 involve ata / piix controller)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jens Axboe <axboe@kernel.dk>, Dan Murphy <dmurphy@ti.com>,
        linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
 <20210112223015.GB28214@duo.ucw.cz>
 <f344f1db-1a7a-0a80-1cb1-f9c3fbf83abd@redhat.com>
 <0ec34bca-f7e0-8954-c253-d07ed6b71b80@redhat.com>
 <20210127220134.GC23419@amd>
 <cc1cac99-e3de-9585-bfa0-db7b013e8a80@redhat.com>
 <20210202093228.GA29131@amd>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <46bcf09c-c4ac-e96b-1813-1798d36cd93d@redhat.com>
Date:   Tue, 2 Feb 2021 11:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202093228.GA29131@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 2/2/21 10:32 AM, Pavel Machek wrote:
> Hi!
> 
>>> Is it a regression? AFAIK it is a bug that has been there
>>> forever... My original plan was to simply wait for 5.12, so it gets
>>> full release of testing...
>>
>> It may have been a pre-existing bug which got triggered by libata
>> changes?
> 
> Fixes tag suggests it is rather old.
> 
>> I don't know. I almost always run all my locally build kernels with lockdep
>> enabled and as the maintainer of the vboxvideo, vboxguest and vboxsf guest
>> drivers in the mainline kernel I quite often boot local build kernels inside
>> a vm.
>>
>> So I believe that lockdep tripping over this is new in 5.11, which is why
>> I called it a regression.
>>
>> And the fix seems very safe and simple, so IMHO it would be good to get
>> this into 5.11
> 
> It is in 5.11 now, and also -stable kernels. (Which suprised me a
> bit).
> 
> Testing would be welcome.

I've been running my locally build kernels with this patch added for
a while now. Including inside VirtualBox where the bug triggered before.

I've not seen any bad side-effects from having this patch in my local
kernels and I can confirm that it fixes the issue which I was seeing.

Regards,

Hans

