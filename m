Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A308A191A6F
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 21:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCXUCy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 16:02:54 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:43488 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgCXUCy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 24 Mar 2020 16:02:54 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 9E195C4449; Tue, 24 Mar 2020 20:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585080171; bh=/w4Mkqq/p7Yx+FSl2Qi+cWkUVMNC7hXtE79ZR06jgtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=yUFXMjq3KbuU/x8m4BYGrBhfr5aeQMzvSBDoKKd2tjR9ykVTn+5p0lO9VqS8NmBOw
         zeTOYHelpDXNSaRK3hEW7nf0nUYa+aT3wHg9dG+DfwZS93BtBPOmXjz6/+Zo/HfG/A
         Ird5xROf7+guwhrcvVytbT84+8WX2lnCCPGHgup8=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0969FC4427;
        Tue, 24 Mar 2020 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585080166; bh=/w4Mkqq/p7Yx+FSl2Qi+cWkUVMNC7hXtE79ZR06jgtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=U7dVF0wHBqFc8tylF9KkKj21nn41+dcADJY5js4u4lEIgh3iMy5iPwgnwhQFq08nL
         qJ8BF8Tb7SOSWjfKesNNuOZyVNdLJFi5a235u6h3IEskZLMaHSJlfuoFYZKD1uSf2f
         4IwrQL9wdPBx4tpnQnCjZNrGymjWB//YZjZZPoMo=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] dt-bindings: leds: Add binding for sgm3140
Date:   Tue, 24 Mar 2020 21:02:45 +0100
Message-ID: <4545531.31r3eYUQgx@g550jk>
In-Reply-To: <20200323205727.GA4038@bogus>
References: <20200309203558.305725-1-luca@z3ntu.xyz> <20200309203558.305725-3-luca@z3ntu.xyz> <20200323205727.GA4038@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Rob,

On Montag, 23. M=E4rz 2020 21:57:27 CET Rob Herring wrote:
> On Mon, Mar 09, 2020 at 09:35:57PM +0100, Luca Weiss wrote:
> > Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
> > camera flash LEDs.
> >=20
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > Changes since RFC:
> > - new patch
> >=20
> > I'm not sure about the completeness of this binding as it doesn't
> > mention the led subnode at all.
> > The only existing led yaml binding is leds/leds-max77650.yaml which
> > mentions the subnode but duplicates properties from documented in
> > leds/common.txt.
>=20
> It's common.yaml now. Reference it from a child node defined here.

Thanks, that helps a lot!

>=20
> >  .../bindings/leds/leds-sgm3140.yaml           | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/leds/leds-sgm3140.yaml

Regards
Luca


