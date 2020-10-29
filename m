Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B4629F8A3
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 23:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJ2WtX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 18:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ2WtX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 18:49:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3D7C0613CF
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 15:49:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id za3so6045366ejb.5
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 15:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1C2xQLUk8lRVPh/Vxwd3NZF/u3YqOBXZJlA7+blI4w0=;
        b=dxKJdsLUeX4mE0cQHbH55/0T8Ra8ERvGpdeLk+mqLpFpcKbiQ40WU97sSwaSRX7rbD
         wbekkQJK/IIjLHyhppMWOqvjCgYaeXxrvvifc0lMHkL5FO2QfT+8UapKwfSwGPUoqXZw
         3AXVefcXRHTjaL+Tzpr5Hi/T68iY2UGsU0vpJdLGqBemt0Ekekbof8iJ3MH7sgG7miLr
         R7pPSEKuqtwU061rDFXjg6LxgB34htarH8061QY5Gwm/fVqK5JgmtWh7u46F+CVcgk+e
         j0ZfKXIwukYdzywJ07bVEKwAbBlipZukIc3tSKZfYTG0LZ+Y28YunvY4e3YkKf3ehV27
         YZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1C2xQLUk8lRVPh/Vxwd3NZF/u3YqOBXZJlA7+blI4w0=;
        b=iWIo8NXjHsEcSykE/ObFaeeqO9VgXjpVk975VxZINQCrRGqJleH6WlRJTQtHmtZJlf
         jSSYBO/nmXcvSwolK818K9SBBt2G894GuKKICTiC56aI778kRI2MBvDDYWsNmlWc29xz
         tEomt5t2xPGxiBaEfCfcEG+gUFT10QTwm7HNe9x/HW1msuGbrVMrkZbBAfaAxQO6KEGp
         Pv825thmTr/jxn44kl2tMP5aV7WQ7w5DrUoM4IIP0YoBDoL+XxdvccqxdWoMEYvRj4Xy
         /dq0AMLR0nhbHl8t+v8o4PmYEAyDmHA+oTTcpzKXBukJpmbcssxIK539AO86NziDZ46r
         /BnQ==
X-Gm-Message-State: AOAM530QKku1eD0rgSWjKS/ascuRtiRUMm7c3jWRD2LX4vlZdenzvgbX
        xrm4+IwJ4gSNB81ImWpOpKVURbQCO/0=
X-Google-Smtp-Source: ABdhPJzA5A1H+K6Bm+Op+v64U2mPbfHsVfnNTbR0K3/Qnxejrig8j+nC6XC7b5EOEB6vyVlAdH1rSw==
X-Received: by 2002:a17:906:6d0c:: with SMTP id m12mr6393472ejr.498.1604011761600;
        Thu, 29 Oct 2020 15:49:21 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:5806:1c4:f304:93f0? ([2a01:110f:b59:fd00:5806:1c4:f304:93f0])
        by smtp.gmail.com with ESMTPSA id qp17sm2137869ejb.111.2020.10.29.15.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 15:49:21 -0700 (PDT)
Subject: Re: ledtrig netdev: what is the purpose of spinlock usage?
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Ben Whitten <ben.whitten@gmail.com>, linux-leds@vger.kernel.org
References: <20201029070000.15472666@kernel.org>
 <20201029174529.GA26053@duo.ucw.cz> <20201029191347.6d509614@kernel.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <984dfc46-f9a0-fb6e-0eef-3837e3fec0b7@gmail.com>
Date:   Thu, 29 Oct 2020 23:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029191347.6d509614@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 10/29/20 7:13 PM, Marek Behún wrote:
> On Thu, 29 Oct 2020 18:45:29 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
> 
>> Hi!
>>
>>> since you are the original author of netdev LED trigger, I guess this
>>> question should go to you. Why are spinlocks used as locks in the
>>> netdev trigger code? Is this for performance? Would it be a drastic
>>> performance hit to use mutexes?
>>
>> Triggers can be called from interrupt context, IIRC, and many simple
>> LEDs can be operated from interrupt context, too.
>>
>> Thus you need spinlocks...
>>
>> Best regards,
>> 								Pavel
> 
> Pavel,
> 
> the set_baseline_state function in netdev trigger is guarded by a
> spinlock only when reading/writing device_name attribute and in
> netdev notify callback.
> 
> netdev_trig_notify can for example put the device away on
> NETDEV_UNREGISTER event, and if someone was reading/writing the
> device_name at the same time netdev_trig_notify is manipulating
> netdevice pointer, it could break. So my guess for the lock is that it
> is used because of this.
> 
> It is possible that netdev_trig_notify can be called from interrupt
> context, I will have to look into this.
> 
> Anyway for the trigger_offload() method to be able to communicate with
> PHYs I need the set_baseline_state function not to be called from
> within spinlock. Otherwise the drivers implementing this method would
> get too complicated. Would it be allright if on netdev event (link up,
> link down, netdev changename, netdev unregister) the set_baseline_state
> was called from a work, instead of directly from the spinlock?
> 
> I will send a patch proposing and explaining this.

register_netdevice_notifier() registers raw notifier chain,
whose callbacks are not called from atomic context and there are
no restrictions on callbacks. See include/linux/notifier.h.

So it looks like the spin_lock_bh() can be safely changed to
mutex_lock().

-- 
Best regards,
Jacek Anaszewski
