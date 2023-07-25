Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C20761BAC
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jul 2023 16:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjGYO3C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jul 2023 10:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjGYO2l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2023 10:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03B72698
        for <linux-leds@vger.kernel.org>; Tue, 25 Jul 2023 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690295243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dJnF4IMbWJYrxuB99HnlouteaOo1bhGX9cG4fPovAcE=;
        b=JAcYhkvJQbcwNObDYC5QL34ExxoOBTSI58BPXD2ZLgXF0g7KJ8J2f0mJv5wW70198RDYDC
        3uuFi/7eHwRiJX2OpQSMGqrUdXkV0c9U6VjKNByJxdqGnVvebQPZGU10oMVXvQVe8w4CIO
        wWBUuu5HU9asrzq9Rg2yeWSKnGTzmfs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-tVtDr9BWMyiBSWKXVwCJuA-1; Tue, 25 Jul 2023 10:27:19 -0400
X-MC-Unique: tVtDr9BWMyiBSWKXVwCJuA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fdde274729so4651254e87.3
        for <linux-leds@vger.kernel.org>; Tue, 25 Jul 2023 07:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295238; x=1690900038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJnF4IMbWJYrxuB99HnlouteaOo1bhGX9cG4fPovAcE=;
        b=OtdTjcTAyVsdRrS82FZ+1q65o1Ife9Jz/h86/Ne2W9FAc9ALEtUqavIlnyRWpEWJ3m
         C37CHRNONc6saocJyZIRdzfLHIaRAVm+JAX27vSEm8DZ51OpLqV//N4MSH3/gOjkyID3
         zmUBP/TgOpi6xaTNWdmXKarIgoXP/+xJiK5tCypZ2Nsi66E3YYt48GtD0o/f/hpbvPUX
         wMNFwx4Y8ulk5VQ5KHKZO7n5hJF9+EnvdE8yg0XcMLPlO60Jpp0iE87DIYjAaHARfZAz
         FieqOaSOdzKMt41uN/EgKV/OeV5zVN1b69fEduMchN1JCqR07zoFZjGqrl1w93Crb6AB
         dQuA==
X-Gm-Message-State: ABy/qLYdoFYPsEDWS7cnAkXpmckxjYywMDu/v/dTcJjG1twMHCvTlthY
        EZpD5ijubLm8nd5GY34wsWVTt+nPljzAzLCHpbf1DpH1WDYP7FcGQchrqL8i48rytWizobMf8gw
        c5XGKbuTdFvsfYhMDcIqFGg==
X-Received: by 2002:a2e:9c93:0:b0:2b4:83c3:d285 with SMTP id x19-20020a2e9c93000000b002b483c3d285mr8493741lji.38.1690295238439;
        Tue, 25 Jul 2023 07:27:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFhD9QRiReJqEWzsge7+DT1OKpTu9gEWpoa4J8ILHirJYUnLhsvhOt61gui1AJ/oAJbR+UhEw==
X-Received: by 2002:a2e:9c93:0:b0:2b4:83c3:d285 with SMTP id x19-20020a2e9c93000000b002b483c3d285mr8493718lji.38.1690295237969;
        Tue, 25 Jul 2023 07:27:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u15-20020a1709064acf00b00992025654c4sm8215701ejt.182.2023.07.25.07.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:27:16 -0700 (PDT)
Message-ID: <be72ecd8-cec1-41ec-b586-e9fb413b1458@redhat.com>
Date:   Tue, 25 Jul 2023 16:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] platform/x86: move simatic drivers into subdir
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henning Schild <henning.schild@siemens.com>
Cc:     Lee Jones <lee@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Mark Gross <markgross@kernel.org>,
        Tobias Schaffner <tobias.schaffner@siemens.com>
References: <20230719153518.13073-1-henning.schild@siemens.com>
 <ZLgJ7Oz1XlicGzEn@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZLgJ7Oz1XlicGzEn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 7/19/23 18:06, Andy Shevchenko wrote:
> On Wed, Jul 19, 2023 at 05:35:15PM +0200, Henning Schild wrote:
>> change since v1:
>>  - switch LED/wdt Kconfig to "default y"
>>  - remove guard which could hide whole siemens submenu, and default m
>>
>> This series does two things. It builds up a Kconfig inheritance chain
>> for all platform device drivers, namely Watchdog and LED. And then it
>> puts all Siemens Simatic IPC drivers in the platform/x86/ directory in
>> a subdirectory called "siemens".
>>
>> That is so that users have to flip less config switches, and to ease
>> maintenance.
> 
> All three good enough, although I prefer the ordering that 'tristate'
> followed by 'default' without interleaved 'depends on'. I leave it
> to Hans. Other that that,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you.

Lee, Guenter do you want me to take the entire series on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc (aka ib-pdx86-simatic-v6.6)

And send an updated pull-req ?

Or shall I take just 3/3 and will you take the Kconfig
changes from 1/3 resp 2/3 directly ?

Regards,

Hans



