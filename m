Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85197517915
	for <lists+linux-leds@lfdr.de>; Mon,  2 May 2022 23:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387640AbiEBV3m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 May 2022 17:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379908AbiEBV3j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2022 17:29:39 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DF7DE92
        for <linux-leds@vger.kernel.org>; Mon,  2 May 2022 14:26:09 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f16645872fso161945827b3.4
        for <linux-leds@vger.kernel.org>; Mon, 02 May 2022 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHBmXpT7UctLtbcxojCov04EssvHKmYOYEKIBGETnkw=;
        b=uNXT/RzGT3RUbkdrMHAt0zpdtVc+lqUR5WaYVWKoH1zEMxp6uRLvJQSgvlelmCs//k
         H/NrwYhVNFTX4b929guY9qWcsQTaryYM5W0WGwu/5J4hTfq79ZYikt/QXH/AJDoWXA7X
         EKy6VdpUAXQEF7kdaxwT/mIriTKCDyCZDPmeKcETkogXOaS0X6uw7xspHxJicCR7WanH
         ZiNKjyhXMmG44Ehz4t3CYqwH0eRQY61gYxTOKwc+064K491QyQuPNf8Blud40cCJ/phv
         QhdC8/ixEkR/onsLMsh8WeSG1nhNUkfyDLs3ow8xcSzd7NaCQ6HXGsIEs00nmYO4JxOI
         oVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHBmXpT7UctLtbcxojCov04EssvHKmYOYEKIBGETnkw=;
        b=y/9YoHEm5deI/iOOVW4seF94ki4CaWpkjCymx1c6hIyQgISMyh4EU/6qn2jTSj9Tfq
         gMrEUxlyrF2MK/l8lqIFAZprrdr9hfL0mplC0F+wAWIABNd68Nb5+ioiUioRRDJbcwTE
         doQPVUBR5A9QTpJ4mjx0LOpPAgWzo8evb5XghGqzCUyckEebkLtu9npC6RE7+7dfZ6Ja
         X0rs9KzXn6rDEgtOR7oY2U1u81m27F4NTmqaZcK4fuQn1X55ZXyYbyoYpE96UJ6O3w7Y
         IbsCSq2+5S5F0ODb17m6KYg56ikuI7xo8dqzdAeWZTCWdkxQ728TL2mwzO5oleRi746D
         pB6Q==
X-Gm-Message-State: AOAM53205/MS9Oz/dviZMFa1jqg2/VIXtYwVSMeErp9bjK0yyxFdk9xq
        KRSPNz1zS67kXvEyk//GXoXS40c4fr73gjUW/dwtR0LiTK8=
X-Google-Smtp-Source: ABdhPJy+xD0fdeNokGShWmA6iyt7amghaRq7DTZYb0f35KOCPRsRoA5MhFMfhTu9dQ2oa36L0hDQ8vZirepPgBijXhI=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr13170533ywh.126.1651526768369; Mon, 02
 May 2022 14:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220404203522.2068071-1-linus.walleij@linaro.org>
In-Reply-To: <20220404203522.2068071-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 May 2022 23:25:57 +0200
Message-ID: <CACRpkdbvdO0Q2A08_H6Yi0U+d_EBRWF1eyFo8EnoODLtF=yFcA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Antonio Ospite <ao2@ao2.it>, Rob Herring <robh@kernel.org>
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

Hi Pavel,

On Mon, Apr 4, 2022 at 10:37 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The regulator is a LED connected directly to a regulator and with
> its brightness controlled by the voltage of the regulator.
>
> Cc: devicetree@vger.kernel.org
> Cc: Antonio Ospite <ao2@ao2.it>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Collect Rob's ACK
> - Rebase on v5.18-rc1

can we merge this patch set?

Yours,
Linus Walleij
