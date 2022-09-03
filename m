Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C775ABEF5
	for <lists+linux-leds@lfdr.de>; Sat,  3 Sep 2022 14:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiICM1M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Sep 2022 08:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiICM1M (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2022 08:27:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7A34D146
        for <linux-leds@vger.kernel.org>; Sat,  3 Sep 2022 05:27:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b44so5857907edf.9
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2022 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3DotglGBHM7VJB0LjM1ubq7vljUnAoT1LI636XYafbc=;
        b=G6xL2PZ3vB0BMGI1sojRXbqpRLDu7OTsHlu3XUKj+RpCCoYTyCOQma5941SG7Yf+ud
         asPKHScrlAiRdSewyRjOyJUtDu63d26gIQVL8SjbC+0lIA43Yn7l634JxbJvi4in4mG4
         eAFajdYYKC7r9jfF3ATT2SxG8gmSuTYP/jy5btmjeZ++XCmxrWm0nOH4YQVxiH1KTlmt
         /PS0uiDWSB+ICcYkREMejsCyxU2sn8FBWuMMLJ4H4S0CgvSszNaFdiWzu2ATsIl0C0iC
         QRaUJp7KSxQvtRGGhSBx0IDuT7FoGycZmEXFLxElek1nCqh7mMYlwnOo3kmS+QKJIBzw
         zKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3DotglGBHM7VJB0LjM1ubq7vljUnAoT1LI636XYafbc=;
        b=UgYVgRb15dWUWbuaj6RShPq4lC4FYt/I5c6rz1PC3oz9eXUCIrC/7lcvbyMGlpGArD
         y92LXJtK1DcsGc0r1pO0qxRbxg0lM6IdDat8uk8vr2Rq9SjhL0I1nB9d8QpBajYSYXb+
         TRlcAGVhcvtkxlp8jH3TCwdeB2XXvqIq5srC8boNBBmfnNFpgcV3GnZTfIQS9qprSep2
         0t4AVmfzhY5+s9h0tJHGsaNWH8bu67eS1pIkPcRk5FYv3P/cXQHihw5iO4WuTSJ3SaFj
         jcemEau3Orzj3hRUFDFPtfXYRWUyU30tggnpNUuG0bvNZANUvhq/oYPbH9kI7WoyjRsB
         hvAQ==
X-Gm-Message-State: ACgBeo2zkVjqDbRoL/Q4V+9SF2ie1jEZzTcYH/jF/nTPx3s/KH1vjSjp
        k4Nt3APlbErP+lNqk2RHfPDNB4Ug8x6rEhzVIMh/SA==
X-Google-Smtp-Source: AA6agR6be9CbDkzLs7qa7+1LbKxQx6HLvkZ6aSdq5ssKIXtBmlw5SoiEzkNGY3rjlnc1B/0oXbfZ/PJC2Mtnj5XZaZg=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr36269197edb.46.1662208028952; Sat, 03
 Sep 2022 05:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220902-get_gpiod_from_child-remove-v1-0-1e47125df20f@gmail.com>
In-Reply-To: <20220902-get_gpiod_from_child-remove-v1-0-1e47125df20f@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Sep 2022 14:26:57 +0200
Message-ID: <CACRpkdat-5T8wv9QH+sVa4pU7u_rf+FTq40pQejpCtqv+YzdYA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Get rid of devm_fwnode_get_[index_]gpiod_from_child()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 3, 2022 at 2:56 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This drops the last uses of devm_fwnode_get_[index_]gpiod_from_child()
> from the tree and drops the stubs implementing this API on top of
> devm_fwnode_gpiod_get_index().
>
> Note that the bulk of users were converted in 2019, the couple of LED
> drivers are all that have remained.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Oh that's neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
