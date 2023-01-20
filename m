Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B34674DFA
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 08:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjATHYX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 02:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjATHYS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 02:24:18 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2023A798EF
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4c24993965eso60381107b3.12
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=KaCoM3liBHtwu146zO8uavA381ipgXY0uzjXg2XKksGT9rDaaRMtWEqD9O/jzIzdak
         gmG5Sqw1pDAApYwpr4zXD8RWY0v0WYH3OxSqAdgk9COf+6V8ubA5sPVcdr2BOHqHY1Dn
         +fnzpj6LexK+W95gY7fbzQ6LApp2M9ik5TOCCesw29+KH090rqXL+LOo8w9gQlGZAEH3
         ws6pQlaA+HtT2K3M8Ndekfa1c0QBdOR59zIjP0D0XPI+kh6WSiy+sXaK3wXcnILDBx1q
         DYZ0jUPHw1CMBZepOtKxjnaJehkch6wDqyrVXGV0Ty0tkcuONQY9n3iYBdsyxy+n29g4
         5IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=FfDwR+k6OKZdSkjDY9nB9amsCwa2d7kQ24vmpV8o+udm1s9qAtBs6Xbr2/JOyuY5M7
         pHCkO12tD42M8JVYttyb1I0zeHnHoXJHQ12pGRm+k/ngbbgU3QqxcowPKdSc3wfC+oIs
         iLheYYxgqOPP/xI8g2vX5tul5WNS5OMYpq+WoOTTk0eHe1FSRMcEndjy76prtpXldFh9
         0vOkl2m5IWcT4JUAvdT6ij9fDzZwF3UvAd6LZ/YMuI0lx0kFYlOu1Q2Flf1T8g6Q6OI2
         7bYSBOLQ3o89yAJ1xNvWo2YwsOVZ4rxOMwh0BO3Ws5L1W7/FsvzZN28fzN8IncpAIw6G
         pxgQ==
X-Gm-Message-State: AFqh2kr6tk1u9pKa2HIaMeF2PwBhZRepUR4sJj/Mkuh5RYMm5slydSSZ
        6T2QaUjxXn3C69mgndMvxcYBwmIsUSoVdBuxYIMKhQ==
X-Google-Smtp-Source: AMrXdXv3cETX80ZlfudJZ3usdoOGqhqv3yEQwywQWIrjTcZDjAwcTdk1BPanKEUmsmWr2/66G8WQSvOsvDXra05ExDY=
X-Received: by 2002:a81:4e54:0:b0:4e1:a40a:af7a with SMTP id
 c81-20020a814e54000000b004e1a40aaf7amr1803574ywb.273.1674199452692; Thu, 19
 Jan 2023 23:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-3-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:24:01 +0100
Message-ID: <CACRpkdYCEnjjDmukA4qzgjyxuR=BHuqVKKAe-uTHcMPoQy37ug@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] leds: led-class: Add led_module_get() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Split out part of of_led_get() into a generic led_module_get() helper
> function.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> led_get() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Rename helper from __led_get() to led_module_get()

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
