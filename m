Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6EB5A13A2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Aug 2022 16:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241303AbiHYObJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Aug 2022 10:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240733AbiHYObG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Aug 2022 10:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5E765578
        for <linux-leds@vger.kernel.org>; Thu, 25 Aug 2022 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661437864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D7VcBhHiv8IbbT8z6tWNMuI4PjjYorz2V+BoVVIIzj4=;
        b=DgKkHX0nwVzO46MgaI0g0xzUs+5ISLGxf2vVK+Cj/73zHN0L0kJiSBqIGxWdkX2qU/GtGL
        LvBONoitBb6VMfQH0+N4/49CQHlHWqZd2A1F8/5ipF+wRuwDQp+VY7+R/jpRfDuSlNrdyh
        SMCWaLSTpL2NrK9kFQQi14HWfQlsxjM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-dGY-jeOvOBm8DDJ1DLwd2Q-1; Thu, 25 Aug 2022 10:31:03 -0400
X-MC-Unique: dGY-jeOvOBm8DDJ1DLwd2Q-1
Received: by mail-ed1-f70.google.com with SMTP id r20-20020a05640251d400b00446e3eee8a1so7156934edd.21
        for <linux-leds@vger.kernel.org>; Thu, 25 Aug 2022 07:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=D7VcBhHiv8IbbT8z6tWNMuI4PjjYorz2V+BoVVIIzj4=;
        b=SN3iii8jQjTxGuGochQArCWY+d18d5tFI5y+pq36WrIVe9OHCEzENalD2Drgk+Lfr3
         9fGYaVvlkn8rQ7iUfkQdK2ZpAd8aanaZvfsmodDg9bJs7Cd/feEklznuc2r5bOnKnnBE
         7EIuywAylLL3HbeoQpTnHgVPrpaMneEGAGxQHoF4cCC1gr24PYAhxPv316oPSMf653qc
         q9oHN5PRW0GQUSN7Ra9CsSk718JuRflRGFxXd+NkSx7nSfLTetVdLzWbsCmyGD9g62wc
         NY5kbi3GmO8mjq9k572jUNyywJzXbzmBT9HUTBAJ6MEdei+32zZLWpYPC9nh/uh585ta
         hJcw==
X-Gm-Message-State: ACgBeo1z8Hpo4jo91gacOscm9m0dC+E1d3ZuGyu8O8o8CNdLHdeHbBtJ
        PpFJa76q52XzqVjpxBtusVvCIn7yaUcXmNv0JmUvN8/xaW0Si26P0ySCT9yQIZeHTAbZ1r/NOr8
        cWllIGqSMVXQc7lCAW7ZBkw==
X-Received: by 2002:a17:906:4fd2:b0:733:f44:c964 with SMTP id i18-20020a1709064fd200b007330f44c964mr2696489ejw.386.1661437862021;
        Thu, 25 Aug 2022 07:31:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6b3DiS6kslr2dz1LOcQtM2Wg/5Z/QUKV4g1gbMzobKli0eVTgE8ZzahF/ObK591Ghk3vWQPQ==
X-Received: by 2002:a17:906:4fd2:b0:733:f44:c964 with SMTP id i18-20020a1709064fd200b007330f44c964mr2696477ejw.386.1661437861817;
        Thu, 25 Aug 2022 07:31:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fj15-20020a0564022b8f00b0044657ecfbb5sm4932421edb.13.2022.08.25.07.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:31:01 -0700 (PDT)
Message-ID: <89680041-c773-0edb-87d6-188bb6d217ad@redhat.com>
Date:   Thu, 25 Aug 2022 16:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 0/7] add support for another simatic board
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
References: <20220825104422.14156-1-henning.schild@siemens.com>
 <34315356-f23e-34ff-98e6-a152b588f201@redhat.com>
 <20220825162910.6c8eab84@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220825162910.6c8eab84@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 8/25/22 16:29, Henning Schild wrote:
> Am Thu, 25 Aug 2022 16:25:49 +0200
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi,
>>
>> On 8/25/22 12:44, Henning Schild wrote:
>>> changes since v5:
>>>   - adding patch to convert to pr_fmt
>>>   - adding patch to prefix macros with "f7188x_"
>>>   - rebased p1v4 to be p3v5 and added tag
>>>
>>> changes since v4:
>>>   - remove int case from a printk in p1
>>>   - include tags into commit messages
>>>
>>> changes since v3:
>>>   - update Kconfig as well
>>>   - drop chip names from comment in driver header
>>>   - add manufacturer check for Fintek again, Nuvoton not possible
>>>   - drop revision printing for Nuvoton
>>>   - restructure defines again
>>>   - add new model 427G
>>>
>>> changes since v2: (p1 only)
>>>   - rename macros that change behavior
>>>   - use chip type not device id in the macros
>>>   - reorder defines a bit
>>>
>>> changes since v1:
>>>   - remove unused define
>>>   - fix bug where (base + 2) was used as second data bit
>>>   - add macros for "inverted" and "single data bit"
>>>
>>> The first two patches apply some style refactorings before actual
>>> functional changes are made.
>>>
>>> Later, This series enables a SuperIO GPIO driver to support a chip
>>> from the vendor Nuvoton, the driver is for Fintek devices but those
>>> just are very similar. And in watchdog and hwmon subsystems these
>>> SuperIO drivers also share code and are sometimes called a family.
>>>
>>> In another step the individual banks receive a label to tell them
>>> apart, a step which potentially changes an interface to legacy
>>> users that might rely on all banks having the same label, or an
>>> exact label. But since a later patch wants to use GPIO_LOOKUP
>>> unique labels are needed and i decided to assign them for all
>>> supported chips.
>>>
>>> In a following patch the Simatic GPIO LED driver is extended to
>>> provide LEDs in case that SuperIO GPIO driver can be loaded.
>>>
>>> Last but not least the watchdog module of that same SuperIO gets
>>> loaded on a best effort basis.
>>>
>>> The very last patch enables a second model of that same board type.
>>>
>>> Henning Schild (7):
>>>   gpio-f7188x: switch over to using pr_fmt
>>>   gpio-f7188x: add a prefix to macros to keep gpio namespace clean
>>>   gpio-f7188x: Add GPIO support for Nuvoton NCT6116
>>>   gpio-f7188x: use unique labels for banks/chips
>>>   leds: simatic-ipc-leds-gpio: add new model 227G
>>>   platform/x86: simatic-ipc: enable watchdog for 227G
>>>   platform/x86: simatic-ipc: add new model 427G  
>>
>> So it looks like all these patches are ready for merging now,
>> the only thing which is missing is an Ack from Pavel or
>> one of the other LED people for patch 5/7.
>>
>> Pavel can have your ack for merging this through another tree
>> please?
> 
> Would i need to send again and include the tags given on v6?

No that is not necessary. The only reason for sending a new
version would be if Pavel wants some changes to patch 5/7

Regards,

Hans




> 
> Henning
> 
>> So what is the plan for merging this?
>>
>> I see 2 options:
>>
>> Option a:
>> 1. Merge the GPIO changes (patches 1-4) through the GPIO tree; and
>> 2. Merge the leds + pdx86 changes through the pdx86 tree
>>
>> Option b:
>> Merge everything through the pdx86 tree, and I will then provide
>> an immutable branch + signed tag for other subsystems to pull
>> (if they want to).
>>
>> Regards,
>>
>> Hans
>>
> 

