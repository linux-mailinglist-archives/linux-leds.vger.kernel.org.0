Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29E164EEBF
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 17:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbiLPQOa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 11:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbiLPQNz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 11:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798EE1173
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671207180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wURGvGbeXFElQK+1JoCJWdzCOYSxxIx6OSpE5tUptwQ=;
        b=UkGIR9f1/mIdMkrHlGWgxJGXsYkfMloFFCaFQcqLfAA19Cruf2Ct++iZwVIyq3m7JWxM6Q
        0aiKrkkpK4zxswnGVIRAbUSAPXzLXpJ648L25/47LSLtTJwh40Ew4RcKKXzKC0XliqzVtz
        /I9NEFMjy/ywReCanQPk5u4Sdl1xvEQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-fUV0A_utNeut8Td0tfo1_A-1; Fri, 16 Dec 2022 11:12:58 -0500
X-MC-Unique: fUV0A_utNeut8Td0tfo1_A-1
Received: by mail-ej1-f71.google.com with SMTP id sg39-20020a170907a42700b007c19b10a747so2140839ejc.11
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wURGvGbeXFElQK+1JoCJWdzCOYSxxIx6OSpE5tUptwQ=;
        b=351RBJq1bc9kIdLRnHSVad96e4xAEITGRHAdNNH6oDdBddK4u1hUujGi0b+XlkoxZb
         tS4nBk6UDQq3btSxS4hnTRuXVQWTCBcYVUvxYu1cmSYQ7sJhXMm2Sgb5wlkg+O9ql2pM
         iOzDM5uor4n02A2tWzE1VbztjZBy+9pijKXCqMjp9lUFgTKBRjl+W/6S/ddMv5Mu792I
         3qMLLpDzoZMNYWoWeT5HMC01JET6xs38uYWQ+mPh1cdS7ePkoqO2yEF28B00nBUrXao2
         NI1pgcMm2OQWfdeSs8wUkY3nN3ahFaPfOd57RLrXmGsUNmxgYjIjOiHW1bCk9U2xXIJI
         dTKw==
X-Gm-Message-State: ANoB5plpl+8H+29EE1cHsxqdK/brElzszmzXwa3J6TYGvl7ACz5FO8up
        +DmpFTLuzhp5W//JqbDLWp9wcgdRzTD36O5ku3Lt+6zzaFDaw3X71Gx+4ChX/68mhEmVn+5tT9o
        OBBHU2WGvD5Wk/TUcFrn1hw==
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17459147ejc.29.1671207177124;
        Fri, 16 Dec 2022 08:12:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50iqeefJRduXX2rwzez9VdVVpN5fpmMgPeScO7DIs4zfQlUWkH2nwxx+hx/Hf6EtQCQOtCxw==
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17459133ejc.29.1671207177009;
        Fri, 16 Dec 2022 08:12:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id co18-20020a0564020c1200b004611c230bd0sm1034983edb.37.2022.12.16.08.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:12:56 -0800 (PST)
Message-ID: <ad2a8bb6-9acf-d3ca-b48f-5f12d45a16eb@redhat.com>
Date:   Fri, 16 Dec 2022 17:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-7-hdegoede@redhat.com>
 <Y5x6iHdMj6Dx0Buf@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x6iHdMj6Dx0Buf@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 12/16/22 15:02, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
>> Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
>> for sensors with a privacy LED, rather then having to duplicate this code
>> in all the sensor drivers.
> 
> ...
> 
>> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
>> +{
>> +	if (!sd->dev)
>> +		return;
>> +
>> +	/* Try to get privacy-led once, at first s_stream() */
>> +	if (!sd->privacy_led)
>> +		sd->privacy_led = led_get(sd->dev, "privacy-led");
> 
>> +
> 
> Redundant blank line?

I find this more readable with the blank line between the 2 ifs.
> 
>> +	if (IS_ERR(sd->privacy_led))
>> +		return;
> 
> I'm not sure I have got the logic right. Let's assume we call it with
> _led == NULL. Then in case of error, we feel it with the error pointer.
> If we call again, we check for NULL, and return error pointer.
> 
> So, we won't try the second time. Is it by design? Or should it be

It is by design, there even is a comment which says so:

/* Try to get privacy-led once, at first s_stream() */



Regards,

Hans



> 
> 	struct ... *led;
> 
> 	if (!privacy_led) {
> 		led = ...
> 		if (IS_ERR())
> 			return;
> 		privacy_led = led;
> 	}
> 
> ?
> 
>> +}
> 

