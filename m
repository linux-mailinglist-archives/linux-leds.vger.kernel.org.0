Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36D3789D05
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 12:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjH0KnK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 06:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjH0Km5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 06:42:57 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430C1E9
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 03:42:55 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d7484cfdc11so2338667276.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693132974; x=1693737774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k41heu0RFGj/vrXovP4h2JkqRtCjrg3Oa5aQHew6OZI=;
        b=ZMp4b9BtnylggkfxoR0PEZ4kPqeyouzQF22L8XryGFq3IllFrZbTQSt/avRB1fl8kF
         Tnw3T7U+zb1zRGJ0aSz+1dJxaEYHqJCof86r5SgftkIOp7NEXSG0lip66Jm8zS9d07Kh
         HQGFXyoJLfFdXjq9F9IE4LfSOijHAdfmBATzch4phXQTDiHNGfDnCUwuxxMrJuUT/rxE
         MTbIY60fprAgVatmHtKsQydV2D3dqRQQJqqyySM/QtMEFh7SR/qOtA4BdnWh0SrePLte
         AOkBIs6GbOkmX46uipSV44xesiMeGNwJAvVkGYlYzNnzhB+6/rbAVaRYc9aY1pQF0DQk
         bZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693132974; x=1693737774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k41heu0RFGj/vrXovP4h2JkqRtCjrg3Oa5aQHew6OZI=;
        b=f0UllMev74M1GQW5gnBp48tX6lr3tEODxmI10/VwPakvpcf4Pgc1cVZydLfPDJZYWu
         Lk/Ow49qBlXcd85GiLIh6foOPI23ojyYm7lmBiaaInhJNIS69cXnKVfNgMwiu2EgxYM6
         IyXObiSM9FiiXNeomn0QVpuVoqDPa5n+IdSHTv8NwYJug/ahgPCgKYFwGRk65xSPz9Qk
         dDAYM0rO7QaAQvX55Q8R+tWRUMgRqa1jxRIImXP43S/2TWXHRuFH55AW4SpX8L4qvVx4
         HXIeIODhDA4w8q/qDE+Y29oqNRNZEe5jQxFUXov7Q13EAPsnJJWZPHa3ZdQjXjvrGDiv
         AAXw==
X-Gm-Message-State: AOJu0YxGxqj8UD5t6Yeh4myph774co3MjU2rj7jBzxjlLW3IEoyswnuV
        g57avwXcabyqWZFID5Taty14LiWu1qtlxkMAxTIWOhemr4r2dXUk
X-Google-Smtp-Source: AGHT+IEx2QsidMoNBEfib6YkDH1+NVBGaRUuwBcuraejSMFrOy5gRemXBeHXtgHEXQAgMU+lysYcNBCZ1jSqX9gjwFY=
X-Received: by 2002:a25:8741:0:b0:d66:d468:62c8 with SMTP id
 e1-20020a258741000000b00d66d46862c8mr21957186ybn.63.1693132974450; Sun, 27
 Aug 2023 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
 <20230827005920.898719-4-dmitry.baryshkov@linaro.org> <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
In-Reply-To: <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Aug 2023 13:42:43 +0300
Message-ID: <CAA8EJppw0Kxo3W560ucWey959368M1c8BFnvF4Ggi5XKCOfesw@mail.gmail.com>
Subject: Re: [PATCH v4 03/38] dt-bindings: mfd: qcom-pm8xxx: allow using interrupts-extended
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 27 Aug 2023 at 11:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/08/2023 02:58, Dmitry Baryshkov wrote:
> > Allow using interrupts-extended, which is a preferred form of interrupts
> > specification compared to the interrupt-parrent + interrupts pair.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > index 7fe3875a5996..33d9615e63c8 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > @@ -37,6 +37,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  interrupts-extended:
> > +    maxItems: 1
>
> The entire patch is not needed. At least should not be needed. What
> problem are you trying to solve here?

The main problem is the next chunk, which (currently) explicitly
requires `interrupts' property. My goal is to allow
`interrupts-extended' in addition to `interrupts'.


-- 
With best wishes
Dmitry
