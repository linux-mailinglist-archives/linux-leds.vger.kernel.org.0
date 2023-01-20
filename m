Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F22E674DF6
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 08:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjATHXo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 02:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjATHXn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 02:23:43 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1803D907
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4ff1fa82bbbso14269517b3.10
        for <linux-leds@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=GpOxgi+k5ZosZ450PFE197mvrRP0Ibe7qoATb35i+zqlseVzyoJOitgNnGNT8yHbqP
         uG+kuWG50d4UZZrRaac6R4cXb71DUlgfay5Hqbe1asRrcvYefcZKEqseZPvwHG3PUNxi
         DUJ/dGUnDUwv9jhMFELVH90Vc/ghdlHP0qIW3xYxcr6HCL3spM5HTuWeJXtkgJoEWvYR
         M+9L1aFoheY+gkE5VcGqnTdQ8WjIS3j6BjR8vebmiVsH1DyG+DjgOA1jNuGuaPxgWh0Q
         5rEpM0eD8wvDiKCCilE5L3Qf9mc2+QsPOhRHRu8EUvNz8Gluym0522J16o8LnKZcX1H1
         ejVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=i4/QFqVXj4wnvhMEGibR2bn7j7zVHTRxmhUhseAItw+NTTP8UFQhFDKu00XZomunXg
         h5g/WG1i+9fcCX0A71XmIme6ZPAA50cXwaPWa5OlhcYepIgjoP7GtAixEJsEvBU55mN0
         00Qr8mnSzgSoDW0gttLQJy8uEuMND2MgNN7onCI9D+/Kon47OnUu7C9w5wea7Xoyv9q5
         VQpYhmX+pueTcXkrynpOYrCRmZpOBp0j1yr12e+hpD236V81QBOtrW3vPyUC2d7ajlam
         OjkPwrdOBiHUIdQFDAJTqqRvOCJWSSGanmwXKfJ9YMuB4ZO50fHAEmbBWPZD6iUvROXb
         MQSQ==
X-Gm-Message-State: AFqh2kosjzbnRuYmO8IZPcJ33hoPdMmQcLx0rCPkb3upsVFuZQ1wyUGS
        v8l0Ql+d0j3DTLi5GVP2KD9Vw2xGg51yfju6Rwhpjw==
X-Google-Smtp-Source: AMrXdXsFy5S/+1aUxe8BBygRPPKpHRVTsDDpZAXb1gt17BAkiOnRhABkE4Oeqj7++tMmtO8taxtaEU1uf4b56dHCj5I=
X-Received: by 2002:a0d:f282:0:b0:4ed:c96d:1b89 with SMTP id
 b124-20020a0df282000000b004edc96d1b89mr1944156ywf.130.1674199420633; Thu, 19
 Jan 2023 23:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-2-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:23:29 +0100
Message-ID: <CACRpkdaZw+M+kKgdV-mSVBTHY95OE51OGCzkvXSzkpen8Ybt7g@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] leds: led-class: Add missing put_device() to led_put()
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
>
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
>
> And also add a put_device() in the error-exit case of try_module_get()
> failing.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
