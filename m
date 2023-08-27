Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE55789DF0
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 14:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjH0M5n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 08:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjH0M5U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 08:57:20 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ECA6189
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 05:57:15 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d780bca9275so2177547276.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693141034; x=1693745834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj8LKx4CnBxMfHurDVM+MhSr1DoWwi/klInNb3DLgxE=;
        b=y6T4i+RmiCuyEiFaXP3WJtnQO+ucT7ZE1hrqzSGnrldF0cAAsF112wwlbylmeF0vrw
         UKvwUdpMMvvSBikDZNOCaEi6Dq5r04aWCbIudBtSjl9XDdmj2E48EnRXUrECRXRKI0RV
         uBuwIdc1Y6HNT3dPvlaa9OBaNTq6/2se7sTtqks5tS3RYhqMJOE7mZ6qFPZ4WROk2tdV
         iLButqPZaDUKaZ8dPs0olUA3neN7y60MWRecTTQmofj8RdE8+UviNpEsBo3a5+3YIGwd
         JlQJv1vRL/fI5AkGiekv+2MFhYhpzaL2+PIQQlRj9A0IZWCl1ENMuSAxEYJj3Q+V4sVt
         zUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693141034; x=1693745834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sj8LKx4CnBxMfHurDVM+MhSr1DoWwi/klInNb3DLgxE=;
        b=Wo8qBG9oZtPUSXxb2yTWH4HF596Mbjc3yfTYz3VhGOFeYfMBfAoRh4PdKCryTK2NMd
         zv2rW+6d3JhZk3GcYZTKO8UWg3SvMDZnfCIWqST9YubfLgGO86vZQgTyr/h0kKtjFJjt
         Xb9E4GPeFngwMmiQivz/FC6pcnRB/jPDorTs9GimF4dXfKC5VJA9rPKlHOaf8LDom8hf
         9V5jhejbGln09o46lGEPdqeM2ROGGdwyhAqsVCyaNEBRZ2k3wvQ3RLiWavyi3iSLVRSc
         yfgLc7AE4HhxuYertNi4aEVUfs1p2YHL8ehyfl/v/1bLY4+EkbOX7B7F7C4KefOykTxB
         7Akg==
X-Gm-Message-State: AOJu0YwvLhBKj54jtlTYhwxpAFniC+JsHpGGXheHAbPW/MvCfwv6ALkC
        V5BTRQZ8LnwyEx9sZ2XwCvAJh4j4Ys3gPxw+HZjw7Q==
X-Google-Smtp-Source: AGHT+IGJrJoS+rbVC0itLsracJvLZBlNmbpwhDfacD2gSucpcry2L0CAeIsQKXmAkFMm1rLMq76i6ti0foQm0Ti5BuQ=
X-Received: by 2002:a25:cccc:0:b0:d78:3a9b:843c with SMTP id
 l195-20020a25cccc000000b00d783a9b843cmr6502400ybf.58.1693141034332; Sun, 27
 Aug 2023 05:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
 <20230827005920.898719-4-dmitry.baryshkov@linaro.org> <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
 <CAA8EJppw0Kxo3W560ucWey959368M1c8BFnvF4Ggi5XKCOfesw@mail.gmail.com>
 <74dcc5b4-dda2-5de7-9e58-4191a0fb7972@linaro.org> <CAA8EJpoWvoNfomMg34cL=h+qBLHQq3bZO2X-02Pcz6oLiKRxWA@mail.gmail.com>
 <e6340d20-40f3-be5c-b4fc-33da59799d91@linaro.org>
In-Reply-To: <e6340d20-40f3-be5c-b4fc-33da59799d91@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Aug 2023 15:57:03 +0300
Message-ID: <CAA8EJpoWEABv6RrZn9FE+5N79Kz=24BhmpdnGbnO+vzX3A8v_Q@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 27 Aug 2023 at 15:00, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/08/2023 13:48, Dmitry Baryshkov wrote:
> > On Sun, 27 Aug 2023 at 14:12, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 27/08/2023 12:42, Dmitry Baryshkov wrote:
> >>> On Sun, 27 Aug 2023 at 11:35, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 27/08/2023 02:58, Dmitry Baryshkov wrote:
> >>>>> Allow using interrupts-extended, which is a preferred form of interrupts
> >>>>> specification compared to the interrupt-parrent + interrupts pair.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
> >>>>>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> >>>>> index 7fe3875a5996..33d9615e63c8 100644
> >>>>> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> >>>>> @@ -37,6 +37,9 @@ properties:
> >>>>>    interrupts:
> >>>>>      maxItems: 1
> >>>>>
> >>>>> +  interrupts-extended:
> >>>>> +    maxItems: 1
> >>>>
> >>>> The entire patch is not needed. At least should not be needed. What
> >>>> problem are you trying to solve here?
> >>>
> >>> The main problem is the next chunk, which (currently) explicitly
> >>> requires `interrupts' property. My goal is to allow
> >>> `interrupts-extended' in addition to `interrupts'.
> >>
> >> They are allowed. Why do you think they aren't? That's why I don't
> >> understand what real problem is here.
> >
> > qcom-pm8xxx.yaml lists `interrupts' property under the `required'
> > clause. So I can not simply replace it with `interrupts-extended'
>
> Since when? So again: The entire patch is not needed.

Hmm, interesting. I'm pretty sure that I saw the issue, but now I can
no longer reproduce it. Maybe I misinterpreted some other warning
which I saw while this was WIP.
I see that it is handled by the `fixup_interrupts` in dtschema itself.

-- 
With best wishes
Dmitry
