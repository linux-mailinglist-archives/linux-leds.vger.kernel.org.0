Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85C4574D39
	for <lists+linux-leds@lfdr.de>; Thu, 14 Jul 2022 14:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbiGNMOi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Jul 2022 08:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239228AbiGNMOY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2022 08:14:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0C125283
        for <linux-leds@vger.kernel.org>; Thu, 14 Jul 2022 05:14:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h17so2365309wrx.0
        for <linux-leds@vger.kernel.org>; Thu, 14 Jul 2022 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=55zD0QXo1chptuJ40MTWPwlftZQu04txJOVAu3oL538=;
        b=ZXYu1GkaXaZUAHXW7NJ2tAYgEpj4bKCVa7T6a9U2i/U65Q0YFw+8PdPsOFQWvF/M6a
         tWuatYf+v5MqLzicwVwbsA57D69Ds36GUtEki3dtP40ajob0dHNUbMs0/ZYvJIHqsKfH
         21xXuA9Hnq8KvrDG8KQciPjVW4xp9veIVUSyWnv1vNEd+DXi1WJF1j8BzcnfhBodAFvt
         Uk7v8wNyGEuy0ksM6dXDpgk51zNJX/lc51pOV0nnjPIlqOUnRyMpqK77xBLYy6tFUtdw
         QzbKo4AexLBk+/mkykQssXcYg9uq60ygYf/GJzfB2N7u4R3lU4AfKl3rowO+9G3ERjQd
         r+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=55zD0QXo1chptuJ40MTWPwlftZQu04txJOVAu3oL538=;
        b=v0e18elUMLNS5h0JRn80w2U04iWFjgRRG1fUBdQ8+MHpxq1j0izRijWeitKzl4OAUu
         LCfFsDdbND6PWvLIPHYywVnox6/ghhq3Rphodsc1sznH9Ym382eStqr5iOafoU4zQxsx
         WNmF3J29ylv8cBxE9HQV7F4D/8kDRE3YKwvIDZ4xBPUCcBMwGFb/+b4XAYRe4BVCxy0Z
         tpFMuYgfsNXoPiLHnnnvWEjuNp6z+OKTn/14R6wsxOv7/IGOt+HKBqSPl5y5YOX8Rbzb
         MSg22rHBBwP8xAGIbTHmkCiUwnqasghmY/YSbvpMKqJyI1MSrADX9SrKzrs7MHsR6Tck
         4Klg==
X-Gm-Message-State: AJIora+xX7fNSykYqWNkylHi0Zz324IW8W3ej2YMXit0AhoaeylIereD
        e0J8C7wiFqG1cu9YFUOae9pwWkKFsycZdw==
X-Google-Smtp-Source: AGRyM1saV55L9vYobgC89Wv4XJvzm19tWEri3/ZcIeaoXiCcTUqM/sFrN8H9v9XzAU0zH9hYub5bsw==
X-Received: by 2002:a05:6000:1046:b0:21d:6c52:b648 with SMTP id c6-20020a056000104600b0021d6c52b648mr8249231wrx.131.1657800861495;
        Thu, 14 Jul 2022 05:14:21 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id d13-20020adffbcd000000b0021d9591c64fsm1375498wrs.33.2022.07.14.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 05:14:20 -0700 (PDT)
Date:   Thu, 14 Jul 2022 13:14:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     marek.behun@nic.cz, linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: LED Maintainership
Message-ID: <YtAIm+X2XchcSkFX@google.com>
References: <Ys/kruf8DE4ISo8M@google.com>
 <20220714112326.GA16407@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714112326.GA16407@duo.ucw.cz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 14 Jul 2022, Pavel Machek wrote:

> Hi!
> 
> > Not sure what's going on behind the scenes, but it looks as though the
> > LED subsystem has been left unmaintained for at least 2 months now.
> 
> > Does anyone have any objection to me stepping in as temporary
> > maintainer until the situation is resolved?
> 
> Yes, I'm a bit busy and would not mind help.
> 
> There's a lot of easy stuff in the LED -- drivers not introducing new
> APIs -- and some quite tricky stuff -- userland API leaves... a lot to
> be desired, and we are in the middle of defining multicolor API.
> 
> I wanted to ask Marek (in cc now) if he would be interested in
> helping. He knows the APIs / issues, and actually has multicolor LEDs
> he cares about. Marek, are you interested?
> 
> If Marek is not interested, yes, help with the driver stuff would be
> welcome.

No problem.  The offer still stands.

I guess Marek and I aren't mutually exclusive either.

Any harm in us both helping out (if Marek is also interested that is)?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
