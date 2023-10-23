Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8ED7D379C
	for <lists+linux-leds@lfdr.de>; Mon, 23 Oct 2023 15:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjJWNSd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Oct 2023 09:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbjJWNSc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Oct 2023 09:18:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091DA110
        for <linux-leds@vger.kernel.org>; Mon, 23 Oct 2023 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698067062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sSFfEkjm+TRHFIpNtkrlAc+VslBdL04S4deDLRJut34=;
        b=aWgaqfJ2O6aWhvM9pzi9tJ+HP+tZTRZ2pMUX8fpFdj8d841VCsNmNUg05AXzg4NaQ7hSOh
        qzJ3uK57H+b3iiwdAdjrKO3ohM/terwNTdK8yPd7bW8JKNwmGNz6cVlJKTat4EQI6nLlx8
        nlMQlGOmNrQu7g/ZNcZQbq+5uq0aLcc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228--wUP3p3MPPKM0X3NioMLnQ-1; Mon, 23 Oct 2023 09:17:40 -0400
X-MC-Unique: -wUP3p3MPPKM0X3NioMLnQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-53fa5cd4480so2120903a12.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Oct 2023 06:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698067059; x=1698671859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSFfEkjm+TRHFIpNtkrlAc+VslBdL04S4deDLRJut34=;
        b=KT2QJjBEM+OfagOn5eE4TRwZOeiSo+UlUMDDaEiL+VEnfyvxsA1lgSxvulAZtm9phL
         GaZ0eutODhtnTQ8wBlSrW2VvdOzfJSf+pSUMdZOYleRLWjqb46U0eRSPwftNaWm7bX+1
         gG+jHxGBkvH5th4Iu4IXg2iDyRFdNMk0pdImR765vB2QjHKp67pScX7zFSYitNKqouui
         l65oFgOoMs76fj/8FgWmun2TFXgXPJ2c6mlEGT2K74WZKFUwkKPNeiaoNHyr1/Lx5w0s
         5zPoSohExGDTfxZ4dGvp4GSnVvrkrcyA40/ffmWkk3+AS50zRc3xgQ7jLdHG7Xut+ola
         eRDw==
X-Gm-Message-State: AOJu0YwNTCvBEEMh6wkACEamru8h0bwFRP9v0JHPFM2XZTnTEhT7bxOp
        /+GYqjWfjBnXjnewOXyrIS/JNP4uYGaUr0jx4h7qoqZgSs2vcVMjqp5xl9QSsFpTHbfAGrYku+9
        VKJDozJ6oO6ZMStEu52h9Yg==
X-Received: by 2002:a17:907:7da4:b0:9bf:4915:22c9 with SMTP id oz36-20020a1709077da400b009bf491522c9mr7444021ejc.32.1698067059567;
        Mon, 23 Oct 2023 06:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEw6I3Skyk2VSTQQ0L/ocw36Hx+FffccCo6LtPT9cF0KLaOGOuHE4Y/IuzoMVRWRlkthG96w==
X-Received: by 2002:a17:907:7da4:b0:9bf:4915:22c9 with SMTP id oz36-20020a1709077da400b009bf491522c9mr7443986ejc.32.1698067059228;
        Mon, 23 Oct 2023 06:17:39 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a23-20020a1709064a5700b009ad89697c86sm6717636ejv.144.2023.10.23.06.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 06:17:38 -0700 (PDT)
Message-ID: <d1f0c5a5-77e1-a7de-88f7-6097a7338f54@redhat.com>
Date:   Mon, 23 Oct 2023 15:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Content-Language: en-US
To:     Sean Young <sean@mess.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
 <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
 <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sean,

On 10/22/23 12:46, Sean Young wrote:
> Hi Hans,
> 
> On Sat, Oct 21, 2023 at 11:08:22AM +0200, Hans de Goede wrote:
>> On 10/19/23 12:51, Uwe Kleine-König wrote:
>>> On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
>>>> On 10/17/23 11:17, Sean Young wrote:
>>>>> Some drivers require sleeping, for example if the pwm device is connected
>>>>> over i2c. The pwm-ir-tx requires precise timing, and sleeping causes havoc
>>>>> with the generated IR signal when sleeping occurs.
>>>>>
>>>>> This patch makes it possible to use pwm when the driver does not sleep,
>>>>> by introducing the pwm_can_sleep() function.
>>>>>
>>>>> Signed-off-by: Sean Young <sean@mess.org>
>>>>
>>>> I have no objection to this patch by itself, but it seems a bit
>>>> of unnecessary churn to change all current callers of pwm_apply_state()
>>>> to a new API.
>>>
>>> The idea is to improve the semantic of the function name, see
>>> https://lore.kernel.org/linux-pwm/20231013180449.mcdmklbsz2rlymzz@pengutronix.de
>>> for more context.
>>
>> Hmm, so the argument here is that the GPIO API has this, but GPIOs
>> generally speaking can be set atomically, so there not being able
>> to set it atomically is special.
>>
>> OTOH we have many many many other kernel functions which may sleep
>> and we don't all postfix them with _can_sleep.
>>
>> And for PWM controllers pwm_apply_state is IMHO sorta expected to
>> sleep. Many of these are attached over I2C so things will sleep,
>> others have a handshake to wait for the current dutycycle to
>> end before you can apply a second change on top of an earlier
>> change during the current dutycycle which often also involves
>> sleeping.
>>
>> So the natural/expeected thing for pwm_apply_state() is to sleep
>> and thus it does not need a postfix for this IMHO.
> 
> Most pwm drivers look like they can be made to work in atomic context,
> I think. Like you say this is not the case for all of them. Whatever
> we choose to be the default for pwm_apply_state(), we should have a
> clear function name for the alternative. This is essentially why
> pam_apply_cansleep() was picked.
> 
> The alternative to pwm_apply_cansleep() is to have a function name
> which implies it can be used from atomic context. However, 
> pwm_apply_atomic() is not great because the "atomic" could be
> confused with the PWM atomic API, not the kernel process/atomic
> context.

Well pwm_apply_state() is the atomic PWM interface right?

So to me pwm_apply_state_atomic() would be clearly about
running atomically.

> So what should the non-sleeping function be called then? 
>  - pwm_apply_cannotsleep() 
>  - pwm_apply_nosleep()
>  - pwm_apply_nonsleeping()
>  - pwm_apply_atomic_context()

I would just go with:

pwm_apply_state_atomic()

but if this is disliked by others then lets just rename

pwm_apply_state() to pwm_apply_state_cansleep() as
is done in this patch and use plain pwm_apply_state()
for the new atomic-context version.

Regards,

Hans



> 
>>> I think it's very subjective if you consider this
>>> churn or not.
>>
>> I consider it churn because I don't think adding a postfix
>> for what is the default/expected behavior is a good idea
>> (with GPIOs not sleeping is the expected behavior).
>>
>> I agree that this is very subjective and very much goes
>> into the territory of bikeshedding. So please consider
>> the above my 2 cents on this and lets leave it at that.
> 
> You have a valid point. Let's focus on having descriptive function names.
> 
>>> While it's nice to have every caller converted in a single
>>> step, I'd go for
>>>
>>> 	#define pwm_apply_state(pwm, state) pwm_apply_cansleep(pwm, state)
>>>
>>> , keep that macro for a while and convert all users step by step. This
>>> way we don't needlessly break oot code and the changes to convert to the
>>> new API can go via their usual trees without time pressure.
>>
>> I don't think there are enough users of pwm_apply_state() to warrant
>> such an exercise.
>>
>> So if people want to move ahead with the _can_sleep postfix addition
>> (still not a fan) here is my acked-by for the drivers/platform/x86
>> changes, for merging this through the PWM tree in a single commit:
>>
>> Acked-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks,
> 
> Sean
> 

