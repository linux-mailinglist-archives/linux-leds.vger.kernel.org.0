Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B284771CB2
	for <lists+linux-leds@lfdr.de>; Mon,  7 Aug 2023 10:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjHGI4a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Aug 2023 04:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbjHGI4X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Aug 2023 04:56:23 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA8F10FD
        for <linux-leds@vger.kernel.org>; Mon,  7 Aug 2023 01:56:21 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d07c535377fso4677209276.1
        for <linux-leds@vger.kernel.org>; Mon, 07 Aug 2023 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691398581; x=1692003381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTR/u2PpG3LKb8wVdD7nsllACEqpd45z6GcRCQZJTqE=;
        b=g2llslmFRX3ySdXig161Vyh5DEUBnJUIvcrEJN67E5rLmdq2oqwU1ffFvhJTzo+MJa
         V/tzrXoX50fE7NHvM/WDa1n6S1g/bewiFxGcTQBEv2HhPJzMuRhghasqF/rZDU5j5ils
         0bXa/jK1mikiBk7bu6CVIUqQsJWnXeVIjy9ZLhcmeWzNqLe+fT5QUA/ncIE+jSgan4Yr
         QeKkQxLUrin9aF9cCdRe3fdd5Q9fQ9g4MSVdSZH+rcyXYoCCXZ8hZdi4Wfd3Y1Zkjk67
         m5vD4x+8NjALkDkWEnYcnlj9OJVqD0t+0KBmfCjyhC1RZlP/GGkTcT1XWLwYrMybClRv
         HsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691398581; x=1692003381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTR/u2PpG3LKb8wVdD7nsllACEqpd45z6GcRCQZJTqE=;
        b=Rsl6hVp3tHXnYzFs/TkfEM8AiDfb8QqJXWmehhpeXk5Y1clOHQ9tbAD2oB/NyE7kRv
         6mwh1apbVvE/Kbz1Z6MKT7xBUWSYw7TaVWGIiRfpRt9gwi+4oVDIW80w7dHdEZXYlzQ/
         BynPYH/IJ4kw4DvWgGxwGl5eykDsGcmJWO9vFhZ85w6EY3yG/R+8F1ebVBb2gqcJXdZB
         fkSxtO2FGk9emiokDSTSNUQuivhJwpybjqAEEXwynPB01y1DSCXZw0ZYPgFw2qVA9LeJ
         Rw0Gk/nWC2xpyHg2VDhDZNok7IvbYEKCJ1jsrw2+BhHhtHgLqB5toA7bkDFackSmAZFZ
         vCQQ==
X-Gm-Message-State: AOJu0YzS25L7uzoCGsiinxLmMI+x6dbGG4Q3nYoDOSJbg/s13IUtyjjt
        Z2weZsWgJWou2bttfhze2kwomjjj8qn0i8CrnONljw==
X-Google-Smtp-Source: AGHT+IEz8bMj8U7s2yoRZBwu0+uMDX8L1rdxKLELEeUY1Cg3hgASws6siBfe5bn9m1H3rny67X2StZqhmW7DsuKoDW0=
X-Received: by 2002:a25:c345:0:b0:d0f:926b:c734 with SMTP id
 t66-20020a25c345000000b00d0f926bc734mr7593218ybf.61.1691398580784; Mon, 07
 Aug 2023 01:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com> <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 10:56:09 +0200
Message-ID: <CACRpkdZFqkn8epsP2OVDO-+Di9ymxe+n02+9Wcc4MAT5ea7GrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names to PCA9532 GPIO
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 24, 2023 at 8:35=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> This is a gpio-controller, so gpio-line-names should be allowed as well.
> pca9532 supports up to 16 GPIOs.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
