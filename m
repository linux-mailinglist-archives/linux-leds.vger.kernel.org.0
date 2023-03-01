Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C156A681B
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 08:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCAH1N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Mar 2023 02:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjCAH1B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2023 02:27:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8CB23C65;
        Tue, 28 Feb 2023 23:27:00 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id i9so16422518lfc.6;
        Tue, 28 Feb 2023 23:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU2JJyqeQDHRAiz7r1BtWY0f9W6Z9jQhhUFBaal+Aho=;
        b=JkNQjc1qQeeChOEWGEH8jmKclFqlnE2bnEhKLXwieYjp9l0FgwNVGQu+xa9a++8Lf2
         NevNTCir3IHwttNdXvucnQGrJ1fpmMWG4SZCMCCxmSc0JhvFbHlMkT8bqQxCLHrtr5+m
         HgAdzQ0OwAw/NrO8BWNES5AYBTpM6IDyuXIR5YID0YDdDTZHl/lhKzZKTwO/t+fM06Al
         i7jw/hgs100o6fU6iByZQpcmKWMgKOuyjDxrH0gTGvF78tOcqFEO9uiO8qtzY7FsiWCZ
         4gDoM54FXcfLk3uEs1tRUpYn6G7GXHJg5/hbN9oH7GyWclR50wdxID5efiYCwA5pKOii
         clgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QU2JJyqeQDHRAiz7r1BtWY0f9W6Z9jQhhUFBaal+Aho=;
        b=cqQup+ugBTc4CDhKRkmD8WYxREWR1rhF5hycG9ezfpqG3IJx9EV1LvGDIXwdYUw5RA
         gXtG/jsVz+WSgW7jay15LlM1z9vcyEdu5F76k4cUKhHye1BJZMUeqnYF/UIdxj/peJYM
         u70iksSp6AJNgE0oWJIG2qSLcxP1q7HiRQvT1qezzE8abycyOOmnpz6eTVKHEckJcvR4
         VR4DjB6rue0wbER6VRk0qkAnPa5lUReVn3VTIIXVVRCoxrjthoSvTs7cjQ2ACusq3oRx
         KIowPJuOWKHNiU6W5GW7EoX/FCbEY7WCUiHHwIFuCPHPGc/FmUL+Sym36I2ZLTj8as4t
         Y6qw==
X-Gm-Message-State: AO0yUKUMY2jCE0Z8XYnZF/IxkzHPLhzACuYCxF40pkA7ZuXnxC8tIyLm
        J2W3wZqQewMPhetTE9T18qg=
X-Google-Smtp-Source: AK7set/yGt8lJH4sgPH2Zg2qwxm+Et/cj0wfGKBXyKR04qIPwFl8HnPh5cCO3xM49+FzZvzS3EiyOw==
X-Received: by 2002:ac2:4c0f:0:b0:4cb:1189:285c with SMTP id t15-20020ac24c0f000000b004cb1189285cmr1781797lfq.10.1677655618172;
        Tue, 28 Feb 2023 23:26:58 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id z15-20020ac25def000000b004dda74eccafsm1621198lfq.68.2023.02.28.23.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:26:57 -0800 (PST)
Message-ID: <e3b20703-f2d4-76b8-ccfb-11cf42d459fd@gmail.com>
Date:   Wed, 1 Mar 2023 08:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] dt-bindings: leds: add "usbport" trigger
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230228144933.22614-1-zajec5@gmail.com>
 <20230301000236.GA20893-robh@kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230301000236.GA20893-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 1.03.2023 01:02, Rob Herring wrote:
> On Tue, Feb 28, 2023 at 03:49:33PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> It's a trigger used on many home routers that have LEDs to indicate
>> specific USB port state.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   Documentation/devicetree/bindings/leds/common.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>> index 15e3f6645682..95b316ee3146 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>> @@ -99,6 +99,7 @@ properties:
>>             - pattern
>>             - usb-gadget
>>             - usb-host
>> +          - usbport
> 
> Can we stop adding entries which are clearly likely to have multiple
> instances. We have a better binding to map the trigger source...

I'm sorry, I really don't understand this.
I'm not sure what do you mean by multuple "usbport" instances.
Could you point me to that better place, please?

This is probably something obvious but I really can't figure it out
since yesterday.


>>         - pattern: "^cpu[0-9]*$"
>>         - pattern: "^hci[0-9]+-power$"
>>           # LED is triggered by Bluetooth activity
>> -- 
>> 2.34.1
>>

