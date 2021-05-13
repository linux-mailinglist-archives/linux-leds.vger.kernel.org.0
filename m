Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D873B37FF70
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 22:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhEMUtL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 May 2021 16:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbhEMUtH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 May 2021 16:49:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D79C061574;
        Thu, 13 May 2021 13:47:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id c22so13590184ejd.12;
        Thu, 13 May 2021 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H4mINdsdXYds/5sATdUIYmsbV+FNndDHPDOhCDo3Rls=;
        b=CNCSOyhyFytemyV2sU9Vbk6spqFQfa+dUlln09qsdRnSV6DDsO3/J/51MMgfQEgmKo
         1o2fp09zAfkATnCPn2zNAErP6+m1IOUBamNo1gFM38M2ZBv56/kOUUfdlD40wFMMhJXc
         K6CLyz0u+VMc+Aa0oMwgwo4xMvDaNb2QDXrJrwrQkjWAkZ0kN8q7QeMCRurqK46nnDyT
         hO5hQl0Y68QaL7GmvyrYX79Ml9TyPoAUafK9G9KbEk9facwz0rKcPK2WUH/QR8eORvC5
         +/aKJj1VBQuMrBRBtiwTVUrYqExlSsFIzRbq7YbPIq5KkjopyvsfB9ej3ajEBizqy2cB
         Oj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4mINdsdXYds/5sATdUIYmsbV+FNndDHPDOhCDo3Rls=;
        b=Lh5LG0O/6IIRZlJJp7rc/7zuCn9+l2wUer7Ywg7EQzb1pDsWZeMmRt1hpocRLYvh/8
         20ObseeRxm7d//CuIRB383aUjKSzr7QUVLpuaFChlLgYqYGp92Zl2TJXzdE0B1QYcZLe
         XAvzlWpubqIAcJu4RaVA2vC+Gq6sVWWeddH3RUNKcnSglRUBvwd+O0obecrBHbfoRAOh
         v80GsRfd8QqiYorCZTqkkjgqU4DFTZKunbKqHNWEi+rme5Na0O2hTIHUSduuh7RJiaNm
         Z0IM+y2HLQxGFZ0kRXfp4oMd8At0uTkcuc8YQ7O+zmvRTmDhBtx6XhcWc0gzQAcdflSM
         6ejA==
X-Gm-Message-State: AOAM5311H+r5EKDyyGyy3RRuGjqo+ukJ8lub6pECCFyg3L/du/GQK6vR
        FYbLbRDkJZZJXIhOleGG+fBsZ8B52DOcMvO4/ZwBto2LO1E=
X-Google-Smtp-Source: ABdhPJze3Ay/us59Gj2mhXRtb5Pl8STZzTXB63JDQKoED3KuFSFVzCEbMtTtddJa1xCNZn8aTYlhoZERJDseXNFg5qM=
X-Received: by 2002:a17:907:969e:: with SMTP id hd30mr28614653ejc.501.1620938875834;
 Thu, 13 May 2021 13:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210511204834.2675271-1-dougdev334@gmail.com>
 <20210511204834.2675271-3-dougdev334@gmail.com> <20210513022036.GA890569@robh.at.kernel.org>
In-Reply-To: <20210513022036.GA890569@robh.at.kernel.org>
From:   Doug Zobel <dougdev334@gmail.com>
Date:   Thu, 13 May 2021 15:47:19 -0500
Message-ID: <CABa6EMYdY9WBN0+edgcEFc0uiBmWUDert7nXCN+FWeRMG=0S6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sorry for the re-send.  I didn't realize gmail was sending everything
HTML encoded.

On Wed, May 12, 2021 at 9:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 11, 2021 at 03:48:34PM -0500, Doug Zobel wrote:
> > Add a new device tree object for LP5562 predfined led patterns.
>
> If you are going to define something generic looking, put it in a
> generic binding.

I'm not clear on what this would be.  After re-running the
dt_binding_check with DT_CHECKER_FLAGS=-m, I see that the pattern
object definitions I have won't work since the numbering conflicts
with the existing led objects.  I was going to move these patterns
under a new 'predefine-patterns' object.  Is this what you mean by a
'generic binding'?

> I don't know that this belongs in DT though. Won't a user want to create
> their own patterns? That means there should be a sysfs interface (which
> we either already have or has been attempted IIRC).

Yes, there is a sysfs interface for running patterns via the firmware
loading interface.  The firmware loading interface doesn't seem well
suited for constantly changing the pattern that the LED driver runs.
I found it to be slow and unreliable when quickly changing the LED
pattern.  The existing predef pattern functionality works much better.
Unfortunately the only way to define the patterns for it is via the
platform data structure.  Adding the predef patterns to the device
tree seemed like a good way to make use of the existing functionality
in the driver.

> >
> > Signed-off-by: Doug Zobel <dougdev334@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/leds-lp55xx.yaml | 103 +++++++++++++++++-
> >  1 file changed, 102 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> > index f552cd143d5b..2524a84fe688 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> > @@ -100,6 +100,31 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/string
> >          description: name of channel
> >
> > +  "(^pattern@[0-9a-f]$|pattern)":
> > +    type: object
> > +    $ref: common.yaml#
> > +    description: |
> > +      LP5562 sepcific object.  LED pattern program saved to and run on LP5562.
> > +    properties:
> > +      pat-name:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        description: Name of pattern program
> > +
> > +      pat-r:
> > +        $ref: /schemas/types.yaml#/definitions/uint8-array
> > +        description: |
> > +          Program data for red channel.  See LP5562 datasheet for program format specification.
> > +
> > +      pat-g:
> > +        $ref: /schemas/types.yaml#/definitions/uint8-array
> > +        description: |
> > +          Program data for green channel.  See LP5562 datasheet for program format specification.
> > +
> > +      pat-b:
> > +        $ref: /schemas/types.yaml#/definitions/uint8-array
> > +        description: |
> > +          Program data for blue channel.  See LP5562 datasheet for program format specification.
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -223,6 +248,82 @@ examples:
> >                 };
> >              };
> >          };
> > -    };
> >
> > +        led-controller@30 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "ti,lp5562";
> > +            reg = <0x30>;
> > +
> > +            led@0 {
> > +                reg = <0>;
> > +                chan-name = "red";
> > +                color = <LED_COLOR_ID_RED>;
> > +            };
> > +
> > +            led@1 {
> > +                reg = <1>;
> > +                chan-name = "green";
> > +                color = <LED_COLOR_ID_GREEN>;
> > +            };
> > +
> > +            led@2 {
> > +                reg = <2>;
> > +                chan-name = "blue";
> > +                color = <LED_COLOR_ID_BLUE>;
> > +            };
> > +
> > +            pattern@1 {
> > +                /* Pulsing blue pattern
> > +                 *   Blue:
> > +                 *     027F: Ramp up 50%
> > +                 *     027F: Ramp up 50%
> > +                 *     4600: Wait 100ms
> > +                 *     02FF: Ramp down 50%
> > +                 *     02FF: Ramp down 50%
> > +                 *     4600: Wait 100ms
> > +                 *     0000: Goto start
> > +                 */
> > +                pat-name = "Pulsing Blue";
> > +                pat-b = [02 7f 02 7f 46 00 02 ff 02 ff 46 00 00 00];
> > +            };
> > +
> > +            pattern@2 {
> > +                /*
> > +                 * HSV rainbow
> > +                 *   Red:
> > +                 *     40FF: Set PWM 255
> > +                 *     41FF: Ramp down 50%
> > +                 *     41FF: Ramp down 50%
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     417F: Ramp up 50%
> > +                 *     417F: Ramp up 50%
> > +                 *     0000: Goto start
> > +                 *   Green:
> > +                 *     4000: Set PWM 0
> > +                 *     417F: Ramp up 50%
> > +                 *     417F: Ramp up 50%
> > +                 *     41FF: Ramp down 50%
> > +                 *     41FF: Ramp down 50%
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     0000: Goto start
> > +                 *   Blue:
> > +                 *     4000: Set PWM 0
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     41FF: Wait 1/2 ramp time
> > +                 *     417F: Ramp up 50%
> > +                 *     417F: Ramp up 50%
> > +                 *     41FF: Ramp down 50%
> > +                 *     41FF: Ramp down 50%
> > +                 *     0000: Goto start
> > +                 */
> > +                pat-name = "HSV Rainbow";
> > +                pat-r = [40 ff 41 FF 41 FF 41 FF 41 FF 41 7F 41 7F 00 00];
> > +                pat-g = [40 00 41 7F 41 7F 41 FF 41 FF 41 FF 41 FF 00 00];
> > +                pat-b = [40 00 41 FF 41 FF 41 7F 41 7F 41 FF 41 FF 00 00];
> > +            };
> > +        };
> > +    };
> >  ...
> > --
> > 2.20.1
> >
