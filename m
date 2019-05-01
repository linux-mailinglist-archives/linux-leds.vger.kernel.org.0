Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DBE1071B
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 12:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfEAKox (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 06:44:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46783 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfEAKow (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 06:44:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id k18so12722200lfj.13
        for <linux-leds@vger.kernel.org>; Wed, 01 May 2019 03:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4LZBcDlUzkUtD9R2mA7ki+aS1U57s1TM7xhlEqohTgI=;
        b=S4xcNWNvJuyX27fM4w5AYdQVRRMzib40n5fpnX1zxFSO6IG6KTf3FIl96BuNK7PoAt
         crNAH2osmR57LdFwBYjWNLnwIvHDoOIf0vGRFd0rd6Tlf46IqunsO7fk4ku8CgM+tccH
         g1owTXOmGnKSMDGIWs+uIlej07vLukubRniWXdzymHJE10Is9ax486+DNxAq2G/O4Xfm
         NCdi0Zbb/Yubj0hKLKzrDNxM89jkZ5Z1AH1n3g7IWAFB9AlTt6vANgp2FzuFTk8WyCFG
         qKB6/uwScy8UiK4YQa5F/4h8zJE+HK/W+vE8PZWZWxAX/0LU80FqxpNfQg4SqqjO+Syb
         tgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4LZBcDlUzkUtD9R2mA7ki+aS1U57s1TM7xhlEqohTgI=;
        b=pjP0dFf0BgWP4N9HgjaKTmjWybd9713wINmjk5ShXfCBfncMLXryRux0/Z0KNabtA6
         /M9GgZDKPvL/zxki3qSuzYQYHZv7Jwv6sC1cCQP6w/1rdKQV96B5DU1hle+/J8LkgW4C
         K9Q+3XMblfsHZ/AsA6vWczQZ8pS+oxBOd7cKHA4GBUD0I1x/PBIBTDE6r/zLTcOcrUpS
         OCOefz4y0bOohAJTCadb3Y1VeCVbiN98Uotcy8d5O8kLRzhyUbL9RdJ8ncfOWzrZEqiF
         o8iB57mxK+DWKNrxhbTf9cObqHAm3e7wsgCnpHQPPFo60+9g3iWTjGa77iON4ZHGkW/R
         swAA==
X-Gm-Message-State: APjAAAVqcVfhFA2BqlyzYT/yG2P3lKwX6Zl2Yeijl2pYCj2mxSE1l2Ns
        VAtaOQMZnfUD3afqgWEjgAI/mkQq
X-Google-Smtp-Source: APXvYqwm11lhM4gcTkQtNfx56rLUD715K3ugOYqqF6mtgfNy0Va+zCOTuoYWKHk8JtlF9KbdlYbPVw==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr36345166lfl.68.1556707490277;
        Wed, 01 May 2019 03:44:50 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id p18sm2876044ljc.54.2019.05.01.03.44.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 03:44:49 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com> <20190430230215.GF20410@amd>
 <20190501024153.643f86f9@nic.cz>
 <6e22f510-c105-35af-d424-a641714318b8@gmail.com>
Message-ID: <a99cf020-cea5-9405-6d8d-f2c4b089f681@gmail.com>
Date:   Wed, 1 May 2019 12:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6e22f510-c105-35af-d424-a641714318b8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/1/19 12:12 PM, Jacek Anaszewski wrote:
[...]
>> Hi,
>> I am aware of this issue. I plan to change the driver to multicolor led
>> class as soon as it is available. But from the discussions I have read
>> it does not seem it will be available in the next kernel release. I
>> would like at least full brigthness for the next release and maybe hw
>> triggering, for which the first version I plan to send this week...
> 
> If you used led-sources property in your DT bindings it would be all
> fine. It will justify having three channels controlled by single LED
> class device.

I've just dropped the driver from linux-leds.git. Please resend
with added led-sources property.

You should provide identifiers in the bindings for each iout and list
them in each child node like below:

LED sub-node properties:
  - reg :                Must be from 0x0 to 0xb, since there are 12 RGB 
LEDs on this
                         controller.
  - label :              (optional)
    see Documentation/devicetree/bindings/leds/common.txt
  - linux,default-trigger : (optional)
    see Documentation/devicetree/bindings/leds/common.txt
  - led-sources : Each child node should describe RGB LED it controls,
                  by listing corresponding iout identifiers:
         0 - RGB LED 0: red
         1 - RGB LED 0: green
         2 - RGB LED 0: blue
         3 - RGB LED 1: red
         4 - RGB LED 1: green
         5 - RGB LED 1: blue
         6 - RGB LED 2: red
         7 - RGB LED 2: green
         8 - RGB LED 2: blue
         9 - RGB LED 3: red
         10 - RGB LED 3: green
         11 - RGB LED 3: blue
	... and list all the iouts, maybe other names will be more
             appropriate for this device, feel free to propose something



Example:

         led-controller@2b {
                 compatible = "cznic,turris-omnia-leds";
                 reg = <0x2b>;
                 #address-cells = <1>;
                 #size-cells = <0>;

                 led@0 {
                         reg = <0x0>;
                         label = "userB";
                         linux,default-trigger = "heartbeat";
			led-sources = <0 1 2>;
                 };

                 led@1 {
                         reg = <0x1>;
                         label = "userA";
			led-sources = <3 4 5>;
                 };

                 led@2 {
                         reg = <0x2>;
                         label = "pci3";
			led-sources = <6 7 8>;
                 };

                 led@3 {
                         reg = <0x3>;
                         label = "pci2";
			led-sources = <9 10 11>;
                 };
                 ...

Then, there is an issue of what configurations we should allow for.
In the simplest form you could restrict that it is possible to do
only single RGB LED -> LED class device mapping.

But maybe it would be useful to allow for grouping more RGB LEDs
under single LED class deivce. It's up to you. It will complicate
the in-driver logic for sure, so for now we can abide by the simplest
mapping - it will need to be stated in the bindings.

-- 
Best regards,
Jacek Anaszewski
