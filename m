Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8576C212F
	for <lists+linux-leds@lfdr.de>; Mon, 20 Mar 2023 20:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCTTUS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Mar 2023 15:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjCTTT0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Mar 2023 15:19:26 -0400
X-Greylist: delayed 415 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Mar 2023 12:11:25 PDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A872A7
        for <linux-leds@vger.kernel.org>; Mon, 20 Mar 2023 12:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679338760; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YOJ8cSb6AGg+LOTkbXoD7ZmVE2S2CkiZGeJbvIsvzP8+1vvZOVLkwr7KEMgnzS3ioS
    gXm2MDWktYs4gJBAGqumz4MimWwWp92dfreucmMpu3GgHpRqz5KUidv2nuGu6BLaQt+Z
    BSX0mFm1kcYoXqbCZ0io9QtwthqCJVu7ymPawxRhgIbkBRB0R7WGppQBZQum0kQTRBPE
    snsbJMvEwVliKsIXA8Y2dImKka+TuhImv9ieFV2lPWa8T9pWdfHbQutiq86GCE+AzSHE
    9J1k2x9oEoogzNAVBrUNjZSxmPMbmQKe0Za8Z9NmKda1SlG3FN0Til6J/BlEh3I5+lJ8
    z83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1679338760;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=V5hdKCN5VuBxAZwl8s4BZYSht3ypC0ayTqwLQ8IldVE=;
    b=Cq6lHgOfjz9fQ93d9fZjOlZlVZvdf7D8ecp3f5HD9V40UocyD5nYISluoXV7wcT8PX
    Sxk61PSh/ezQ9FkzLL/f06UWDtx/iFul03Sv7XCvc/JZX4lP+zRpxcm3loQn6YjHmWav
    Ugo6d8+JbGf8+ayc/p/HeRoOn4e/5FNsmIHzoX/2+U3gsUOzYeQb5UzGdqXzbNLFyjOz
    zyr5/3Tg+nn0LOd0HklY3rWT+KoL/j6Ot5fhw56xhTgWA9KnDbRiPSrvxsHMJQv8Sg8h
    6efA7BdiQUiIzUpp5hQREuif3B65kYMgI+1ThMV+1q2JiWG1WR/A2PbGzlpCuop2L4Iq
    6Hyg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1679338760;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=V5hdKCN5VuBxAZwl8s4BZYSht3ypC0ayTqwLQ8IldVE=;
    b=SpQYdyvR4ABWIud+oPqrh2gIyC5EfK1pcXrIquvk2qZjTa/Qkl43gWD+zlXQevXDUx
    1dD+6spt0l6joIRducVFwyH9NntFqmaxWifyhThvc1R0BQHhWB0pjP7w6oSz3fsnlm+3
    77D96GA1Gsfrp9q1wV963MseDx5rtMA/y4td9HjSi6Wv3l4XQmy8iLK7EBM7pHggdKoN
    Fe6XU2C6TQfY7OXBSA5RuxrNSqj+dfHQn9oPMfGV9r6Liihp8zOv07Qro3BX8z4GXC5i
    0UlXRex6tqyajYRNzSh7c1wEMUU9M3AY0E6SVS0SIlnPKrtCbw2eNkLBmxPjBfOlmAey
    MG+Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKjXrK8x8qY="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.3.1 AUTH)
    with ESMTPSA id i40d22z2KIxJDLR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 20 Mar 2023 19:59:19 +0100 (CET)
Date:   Mon, 20 Mar 2023 19:59:12 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: aw2013: Document vddio-supply
Message-ID: <ZBitAGOmF/hyxDYP@gerhold.net>
References: <20230320174949.174600-1-linmengbo0689@protonmail.com>
 <20230320175131.174657-1-linmengbo0689@protonmail.com>
 <922eab51-6931-8533-db51-51cd911a36b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <922eab51-6931-8533-db51-51cd911a36b3@linaro.org>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 20, 2023 at 07:04:22PM +0100, Krzysztof Kozlowski wrote:
> On 20/03/2023 18:55, Lin, Meng-Bo wrote:
> > Some LEDs controllers are used with external pull-up for the interrupt
> > line and the I2C lines, so we might need to enable a regulator to bring
> > the lines into usable state.
> 
> Not a property of this device.
> 
> > Otherwise, this might cause spurious
> > interrupts and reading from I2C will fail.
> > 
> > Document support for "vddio-supply" that is enabled by the aw2013 driver
> > so that the regulator gets enabled when needed.
> > 
> > Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> > index 08f3e1cfc1b1..79b69cf1d1fe 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> > @@ -23,6 +23,11 @@ properties:
> >    vcc-supply:
> >      description: Regulator providing power to the "VCC" pin.
> >  
> > +  vddio-supply:
> > +    description: |
> > +      Optional regulator that provides digital I/O voltage,
> 
> NAK. I responded to your patch and you just send a v2 without explanation.
> 
> The device does not have VDDIO pin, either.
> 

The power supply Lin is trying to add here is basically the "VIO1"
example in "Figure 1 AW2013 Typical Application Circuit" on page 1 of
the AW2013 datasheet [1]. The I2C pins and the interrupt output are both
open-drain and therefore require external pull-up resistors, connected
to a power supply that might not be always on.

Because of the open-drain pins AW2013 does indeed not have a dedicated
input pin for the I/O supply voltage. However, it is still necessary to
describe the power supply _somewhere_, to ensure that it is enabled when
needed.

It is hard to model this properly but it's generally easiest to handle
this inside the peripheral driver since it knows exactly when I2C and/or
interrupt lines are currently needed or not. This situation is fairly
common for I2C devices so there are several precedents, e.g.:

  1. cypress,tm2-touchkey.yaml: "vddio-supply"
     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3e730ec11d51283ad62a98436967c01b718132ab
  2. goodix,gt7375p.yaml: "mainboard-vddio-supply"
     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1d18c1f3b7d938bdefc44289d137b4e6c7a3d502

Would "mainboard-vddio-supply" from the second example be more clear
than the simple "vddio-supply"? Naming things properly while staying
concise is hard. :)

And if you have any suggestions how to describe this in a better way
please let us know!

Thanks,
Stephan

[1]: https://datasheet.lcsc.com/lcsc/1808311530_AWINIC-Shanghai-Awinic-Tech-AW2013DNR_C252440.pdf
