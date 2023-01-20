Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC99674E1B
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 08:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjATH1s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 02:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjATH1r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 02:27:47 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275BF7DF93
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:27:40 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id p188so5645566yba.5
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QlUWiI5nTcVmF38kshYLIWxML+W7oEiyJGFqEIwOzso=;
        b=yUvnFC7lkpJvy/2KC3TC6u8ENtkI2aT2j5b/jyuhIJlKC0RFwpWwj844Dl8T1/h9e9
         yzmd/MwTb5/WN0w6zUsxzGD6ryc4aX09HnUY7ZwkzlW9ftkGv2ZK7YxlVUG+6EHvoXDt
         hqIZTICglVjS0nCfNyLQ7lC4pPw8hNaOUAHGq7OFrxTrpaGeEZBTfqDv4NdYPik/SbQf
         eNW3NMZP+lAKKT1LdbyAmguWqNCgh/cm4WPq9eOhjwK1/qrIahY8w5/BlE0CJcqNCE7/
         5j3dY/+lJEqg7LdzT3wNbUBcBP8aNk0BZi0jtEgwU5nmcPDnSAOaBh/xA7VaENRSPXag
         Fnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlUWiI5nTcVmF38kshYLIWxML+W7oEiyJGFqEIwOzso=;
        b=Vfhi+4RMsK7GJnmpA3TWlg1DPkt6uLveH5C27sfbdEUwLjltGo6ziScBsLv5Tp7t18
         xUW295SZMtzTZ4Np2LDkelQoVxmZRWSTLDe9OG0+OrHVBrz+Zci4QV7M4YMuiagH8Kvq
         5Jv+HXuet+okzOtLblABZaewYpfrFVMYwX1AGygJ5Erf1HZmB+tiM/LPHdB5zdBccB4K
         moHY1J9aDCM/QbtOieyJDzR51DR2cqHPkmnetW8T+fxztGvITuk743K56q08I4i/F015
         0mjnGDYbClg/X+OiUQ8lxMOzAj/+CQNipz/ThVnCyVZRxS3EQZAraZUOb0ceIuuSJqyH
         HZnA==
X-Gm-Message-State: AFqh2kpnYOoYn02oUAdz9ZSUvnL+tBORGDwu9t0rojePtNqA1rCjy/i1
        UzQFkacl7MEu2gVywbn5zSzJ8w6DhK1954wV5ShJkg==
X-Google-Smtp-Source: AMrXdXuOBtudLf5qWOjxyEQ40sEZuYzIhoeb6bXwF6E/nI3Vz0hd9m8Z18XeVvEZoJoX2c5ei7EYbeYNt4cCgjYOd24=
X-Received: by 2002:a25:5303:0:b0:7e4:fa1:b33 with SMTP id h3-20020a255303000000b007e40fa10b33mr1337598ybb.460.1674199659336;
 Thu, 19 Jan 2023 23:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-6-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-6-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:27:27 +0100
Message-ID: <CACRpkdbB7nJZv=Ky9Z5CdgGns0VimStJK9fRtngDspX=TkPnuQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] [RFC] leds: led-class: Add devicetree support to led_get()
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

> Turn of_led_get() into a more generic __of_led_get() helper function,
> which can lookup LEDs in devicetree by either name or index.
>
> And use this new helper to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
>
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
>
> Note the new led-names property for LED consumers is not added
> to the devicetree documentation because there seems to be no
> documentation for the leds property itself to extend it with this.
> It seems that how LED consumers should be described is not documented
> at all ATM.
>
> This patch is marked as RFC because of both the missing devicetree
> documentation and because there are no devicetree users of
> the generic [devm_]led_get() function for now.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Same grumpiness about __functions but this is overall nice so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
