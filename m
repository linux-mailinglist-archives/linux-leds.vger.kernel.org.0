Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FCB298160
	for <lists+linux-leds@lfdr.de>; Sun, 25 Oct 2020 11:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415316AbgJYKy5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Oct 2020 06:54:57 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:55380 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1415315AbgJYKy4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 25 Oct 2020 06:54:56 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 2B3B3C4714; Sun, 25 Oct 2020 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603623294; bh=xE4oIqCqU+X7jXWVw6nVPCb6ZHCg8ImuMwGFrOZrO5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Am86pYkkTNY2Nh5k1GGFaKLYX1A7Y0HCSX/Jg06eRE91j14Pyg8AoSny77t+maJ6F
         F9JU/EWTjx6bP/cSU04HAK0h+EUw0yUGXhOZ4eRCOvAhsPbmQfWQw5prLK5vCsfdSf
         2M8h8HjfvRKp6IOiIiw5zJhgo3GkcCS540eomaT8=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (91-115-27-239.adsl.highway.telekom.at [91.115.27.239])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9295EC4700;
        Sun, 25 Oct 2020 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603623291; bh=xE4oIqCqU+X7jXWVw6nVPCb6ZHCg8ImuMwGFrOZrO5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a4upOd3uYtlGEAyOjURRYtCpEEdPX+CAI6DowBJGqYxn0M1/3IsTh8+W8RC4qg/9N
         GsjgTap40J3TeggfPBRaGk/cNojN09fdBJmOzeLlvVqr862Ru2oS1dnNkkXzxrwJ6D
         S4uwzKeKiWl7KmasstTQ01XKFj4NESO6bY/xKn6g=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     bjorn.andersson@linaro.org
Subject: Re: Clarification regarding multicolor leds
Date:   Sun, 25 Oct 2020 11:54:50 +0100
Message-ID: <2299544.FhU3MROB3G@g550jk>
In-Reply-To: <534b4937-b7ec-fc63-325a-c8e1e268b85b@gmail.com>
References: <24145961.oFyDssk0vh@g550jk> <534b4937-b7ec-fc63-325a-c8e1e268b85b@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek

On Samstag, 24. Oktober 2020 21:34:38 CET Jacek Anaszewski wrote:
> Hi Luca,
> 
> On 10/24/20 12:48 AM, Luca Weiss wrote:
> > Hi,
> > I'm currently experimenting with the qcom lpg[0] which is a driver for the
> > rgb notification led found on e.g. Snapdragon 801 devices (and many
> > more), specifically my example is about the Fairphone 2
> > (msm8974-fairphone-fp2).
> > 
> > [0]
> > https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@lin
> > aro.org/> 
> > My dts is looking like the following (abbreviated):
> >      [in lpg node]
> >      multi-led {
> >      
> >          color = <LED_COLOR_ID_MULTI>;
> >          function = LED_FUNCTION_STATUS;
> >          ....
> >      
> >      };
> > 
> > I'm comparing this to the PinePhone where the leds are defined as follows:
> >      [in gpio-leds node]
> >      blue {
> >      
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_BLUE>;
> >      
> >      };
> >      
> >      green {
> >      
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_GREEN>;
> >      
> >      };
> >      
> >      red {
> >      
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_RED>;
> >      
> >      };
> > 
> > (sidenote: the LED_FUNCTION_INDICATOR should probably also be
> > LED_FUNCTION_STATUS there; the dts was made before the better descriptions
> > for the defines have been added)
> > 
> > This gets the following directories created in /sys/class/leds/:
> >      blue:indicator
> >      green:indicator
> >      red:indicator
> > 
> > But with the multicolor led on the Fairphone 2 only a directory with the
> > name of "multi-led" gets created which I would have expected to be
> > "multicolor:status" instead.
> 
> This is because the driver from patch set [0] does not use *ext()
> multicolor registration API, but follows old-fashion LED name
> initialization via 'name' property of struct led_classdev, which is
> initialized to DT 'label' value or DT node name if the former is absent.

Right, I remember now having done something similar with my sgm3140 flash led 
driver half a year ago, thanks for the reminder!
With the qcom-lpg driver using the _ext function it works as expected.

@Bjorn I've prepared a diff for your patches at
https://public.z3ntu.xyz/tmp/lpg.diff where 
1. LED_COLOR_ID_MULTI is replaced with LED_COLOR_ID_RGB based on these emails
2. The example in the documentation uses LED_FUNCTION_STATUS (see description 
for the constant in include/dt-bindings/leds/common.h)
3. The _ext registration api now gets used, see e.g. commit 5b4b723c483f

Thanks for your help, really appreciate it!
Regards
Luca


