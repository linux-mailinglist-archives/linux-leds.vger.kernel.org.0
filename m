Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7AF185C09
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2020 11:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgCOKrm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Mar 2020 06:47:42 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:60488 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728234AbgCOKrm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 15 Mar 2020 06:47:42 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 06106C436B; Sun, 15 Mar 2020 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1584269261; bh=K/jCEoevmLMa/jIMtbempZ4v4lAPs/LPy5wBlLKCZCA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=INi1boVdw6+4Z9aVStGDJBmNbes0vSCzIP6TcLC2vgM7JT2y0q3Y1rpYjy5S8vnHB
         23hC9dz+0Mt6WZqQ9DUJdfCdELf/QBwjUj67uPGGzdTLO5PbvChLNYKdT1ruljbKOg
         j3JRWhlF33Y9D759MCkAzEG/OFUyPwDZ8oHDLkCw=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1C308C3FF8;
        Sun, 15 Mar 2020 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1584269257; bh=K/jCEoevmLMa/jIMtbempZ4v4lAPs/LPy5wBlLKCZCA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CPUpVdyXytdfuyDOT5E19G5nuTqfUbnCoJigzZTZ3AYf4YlRwO5INewZ1ImB+wLo1
         lTf3QUbbMWuQjX9Xpyc93GpQlid2p/hrg0On5G4Oh0QObDLFSSaNbMgDj89RuDbXON
         6olTo/ofR49kgRyAMSD4Pu4vvWnHe0UVq47bGgnQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] dt-bindings: leds: Add binding for sgm3140
Date:   Sun, 15 Mar 2020 11:47:36 +0100
Message-ID: <3051566.44csPzL39Z@g550jk>
In-Reply-To: <4f848ab3-0e76-ae63-0771-758b1eaa0660@ti.com>
References: <20200309203558.305725-1-luca@z3ntu.xyz> <20200309203558.305725-3-luca@z3ntu.xyz> <4f848ab3-0e76-ae63-0771-758b1eaa0660@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan

On Mittwoch, 11. M=E4rz 2020 13:49:35 CET Dan Murphy wrote:
> Luca
>=20
> On 3/9/20 3:35 PM, Luca Weiss wrote:
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
> >=20
> >   .../bindings/leds/leds-sgm3140.yaml           | 53 +++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> >   create mode 100644
> >   Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> > b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml new file mode
> > 100644
> > index 000000000000..be9384573d02
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-sgm3140.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SGMICRO SGM3140 500mA Buck/Boost Charge Pump LED Driver
> > +
> > +maintainers:
> > +  - Luca Weiss <luca@z3ntu.xyz>
> > +
> > +description: |
> > +  The SGM3140 is a current-regulated charge pump which can regulate two
> > current +  levels for Flash and Torch modes.
> > +
> > +  It is controlled with two GPIO pins.
>=20
> Please define "It".  Not sure what is controlled here.
>=20

"It" means the SGM3140. Not sure how else to write that or what the correct=
=20
term for such a component is.

>=20
> Dan

Regards
Luca



