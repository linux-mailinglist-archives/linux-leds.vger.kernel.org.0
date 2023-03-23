Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBC76C6676
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjCWLY5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbjCWLY4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06250193E7
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679570649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bElMb8tRd400aVPGEdqHySnfBygLanMFOxdRzx2RmHY=;
        b=i7QL5IRSsJh2uZnO7rAOuBSMyar4bC0vWXdsjyn6CasigbYIAq5Aw94ZpqkhX77Qk/xn2y
        era1s8N5me5UZgpI/XZ4ysBP06EWvuy6WsI0SWoVaM3rB7msGLe6vVddwLMQXpd6vWovbn
        ah9WrnZ5id4W6SEgQj04ZBvyBG1Z6Yc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-71kLXYoyN5ywH8x7YA_OZg-1; Thu, 23 Mar 2023 07:24:07 -0400
X-MC-Unique: 71kLXYoyN5ywH8x7YA_OZg-1
Received: by mail-ed1-f71.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso32307199edh.15
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bElMb8tRd400aVPGEdqHySnfBygLanMFOxdRzx2RmHY=;
        b=fICQ1W/TfC2QpFjCXPGKFMwZ3RBmz3RCi9EkEK6FG/4lNF8low64e1VBGB0u30EHI1
         cIDE3DpRqKZ4X+2PKN5x1iCbPRzPZezHNlC0U/URWKupP4Es2ShxIkCnk7q47214agNQ
         p+J9Ov3h/mrrVPXsaBbfhUWJ101hGXjrAy4uUGJEEW2TKwEpL50J1Mk30fg+rnqZ8RyD
         VgXY5CQVVPPp3h3PuKUmdq1NkMPn9RdTk8kPLeK6u6yBc/q1ZWTMbRhpENN5hlP9xaln
         8CIvW6B6FFNolHRwkn5tucEDLUKW8iGCbE3gDLJ9JWRObp5Vb8IxgWqoPYiLoe2FFrp0
         XOjg==
X-Gm-Message-State: AO0yUKWhhjXkV75tHoHTyoeady6IlUna0ImLPKa5lT896XztMm9vbxQF
        oULJ49Xn0/O2EEpeLx91iKT+KD0F7663VFLiqgKudCgFmC0ZVy1e9Hyu7bX720IHW9D0PyYEe8y
        rGJ2JNQVPpoIfKpm5jULWHw==
X-Received: by 2002:a17:906:314c:b0:933:4556:d1cd with SMTP id e12-20020a170906314c00b009334556d1cdmr5722874eje.33.1679570646882;
        Thu, 23 Mar 2023 04:24:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set/qbV2U20xLJrdSX7bwVjb3H7386kZEseQhYAyoNi+gZqE4olFNwYVYU2DgCFw6C/uNMw42PA==
X-Received: by 2002:a17:906:314c:b0:933:4556:d1cd with SMTP id e12-20020a170906314c00b009334556d1cdmr5722850eje.33.1679570646573;
        Thu, 23 Mar 2023 04:24:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906715000b00930894eb708sm8552017ejj.223.2023.03.23.04.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:24:06 -0700 (PDT)
Message-ID: <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
Date:   Thu, 23 Mar 2023 12:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
To:     Pavel Machek <pavel@ucw.cz>, Kate Hsuan <hpa@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com> <ZBw0wiFztPs/LP6r@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZBw0wiFztPs/LP6r@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 3/23/23 12:15, Pavel Machek wrote:
> Hi!
> 
>> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
>> tps68470 provides four levels of power status for LEDB. If the
>> properties called "ti,ledb-current" can be found, the current will be
>> set according to the property values. These two LEDs can be controlled
>> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> 
> If the LED can have four different currents, should it have 4
> brightness levels?

No this was already discussed with an earlier version. This is in
indicator LED output. The current setting is a one time boot configure
thing after which the indicator LED is either on or off.

> 
>> +++ b/drivers/leds/Kconfig
>> @@ -827,6 +827,18 @@ config LEDS_TPS6105X
>>  	  It is a single boost converter primarily for white LEDs and
>>  	  audio amplifiers.
>>  
>> +config LEDS_TPS68470
>> +	tristate "LED support for TI TPS68470"
>> +	depends on LEDS_CLASS
>> +	depends on INTEL_SKL_INT3472
>> +	help
>> +	  This driver supports TPS68470 PMIC with LED chip.
>> +	  It provides two LED controllers, with the ability to drive 2
>> +	  indicator LEDs and 2 flash LEDs.
>> +
>> +	  To compile this driver as a module, choose M and it will be
>> +	  called leds-tps68470
> 
> . at end of line.
> 
>> +static const char *tps68470_led_names[] = {
>> +	[TPS68470_ILED_A] = "tps68470-iled_a",
>> +	[TPS68470_ILED_B] = "tps68470-iled_b",
> 
> No. See Documentation/leds/well-known-leds.txt . We want the LEDs to
> be named after their function.
> 
>> +static int tps68470_ledb_current_init(struct platform_device *pdev,
>> +				      struct tps68470_device *tps68470)
>> +{
>> +	int ret = 0;
>> +	unsigned int curr;
>> +
>> +	/* configure LEDB current if the properties can be got */
> 
> english?
> 
>> +	if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &curr)) {
>> +		if (curr > CTRLB_16MA) {
> 
> We'll need device tree binding documentation, right?

For now this PMIC is only used for the camera in some x86/acpi designs,
so no we don't need dt binding documentation (the dt binding maintainers
have explicitly asked to not add dt binding documentation for things
not actually used with dt).

Or I guess we should simply add this to the platform_data which
one of Daniel's later patches introduces and drop the initializing
of the LEDB current setting from the initial driver addition.

I think that that (moving this to the later added platform_data)
would be best. Since now after Daniel's patches we have a mix
of platform_data + the 1 device-property for this.

Daniel, what do you think about moving the LEDB current setting to your
"[PATCH 2/8] leds: tps68470: Init LED registers using platform data"
patch ?

Regards,

Hans


