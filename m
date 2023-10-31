Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DC67DCCBC
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 13:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbjJaMMk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 08:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjJaMMk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 08:12:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DDF97
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 05:12:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E46C433C8
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698754357;
        bh=AtFsM7vmdaICWeH7H4g00lGzTBFyOhF3MTfCBNscuxQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=udTHqRy23RlQPv7mGCxP71xrl/Jphxn9fCaPB3/RjAOxlVpdGmMEKyZ3Hs7V+ZkFO
         d4JMKIIZJ7ZQI7qh3dKM5CrnwKv6x0QHjS2Y8gVz7dAgo5hLLmPTR/wQOnwUrPS9xg
         3i9XXcsxUBFqsEU0mJP8O9cpx5QWfdhmKip0rstV0K1G+rw2F73UFlKt//0s3vltaV
         dn18EJdfu9ehRspI5h3/LDgVVB8vJ2BEwaHXPI08BxtOzxV9cXSUB1BvKi0yK12q/w
         S6Amum5XI3mB9WwtenUHQZB65vRNfSUZtx2LgyJe+zCoVru8ybIWO4DX+/yMeVTZUZ
         tP6TzQP9cma6Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a98517f3so7798550e87.0
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 05:12:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/RBHhwe+wzKCsyRG8KxUTBMehENChA/vYPmdZflxC5odF8Bgl
        Oynz7XFUcD5xy4JcHO9vgKkrkg8FCOZs/D2p8g==
X-Google-Smtp-Source: AGHT+IHmCdIzoS6q1W+2YsebeCmSXnInR3hc91C1feKpBPor7LjnPrIFywiDZsdSMxjRmfdphpQNwkixmaXGH80Aa9Y=
X-Received: by 2002:a05:6512:3ac:b0:507:984b:f174 with SMTP id
 v12-20020a05651203ac00b00507984bf174mr8528629lfp.48.1698754355860; Tue, 31
 Oct 2023 05:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231031111559.12199-1-yangshiji66@outlook.com> <TYAP286MB0315FE921FF113BF76F7B700BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB0315FE921FF113BF76F7B700BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 31 Oct 2023 07:12:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxVeA=F32H7ZhTxMJgX-BeAcm2nVdyvHBZdKxnTGcYSg@mail.gmail.com>
Message-ID: <CAL_JsqLxVeA=F32H7ZhTxMJgX-BeAcm2nVdyvHBZdKxnTGcYSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: sort LED color definitions by alphabet
To:     Shiji Yang <yangshiji66@outlook.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 31, 2023 at 6:16=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:
>
> Sorting LEDs by alphabet can help developers quickly find the colors
> they want. Infrared and multicolor LEDs are special so they should
> be left at the end of the list.

This is an ABI. You cannot renumber them.

Use get_maintainer.pl when sending your patches. You missed the DT list.

>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  include/dt-bindings/leds/common.h | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
