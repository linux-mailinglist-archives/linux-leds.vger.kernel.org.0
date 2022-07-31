Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01425586017
	for <lists+linux-leds@lfdr.de>; Sun, 31 Jul 2022 19:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbiGaRVs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 31 Jul 2022 13:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiGaRVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 31 Jul 2022 13:21:48 -0400
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A87DE94
        for <linux-leds@vger.kernel.org>; Sun, 31 Jul 2022 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1659288100; bh=4vYMbgbvivnyoeTUmEdYccSCHXxxow9Plcr7z6AzEnM=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Date:In-Reply-To:References:
         Content-Type:Content-Transfer-Encoding:MIME-Version;
        b=QAw/CsGrTz1S5PnFRBrFubFXZHAfwkNAn5L3rj09Vjf5U18AYbedy59N97vjaz7QZ
         ZLNPViSEmN/FkUvVk1d5K8QjUFoKw83+n/trr9eBX6934gHOVgw/1Z8CYJxgd0OJ0d
         kT92uOjMEtMA1RCucRGwHmK1IBdukHLrfThGxha8=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via [213.182.55.207]
        Sun, 31 Jul 2022 19:21:40 +0200 (CEST)
X-EA-Auth: NI39qGEJPnXzEQbdoefTme3qbQgc240mJV6ZbxukdHQUKkMQ78Zzh7LAfGLegO/N8aoDD5sP5P1i3cWEKzyw6+HCbMnhfzMhywpFZwQmH98=
Message-ID: <9d50c9ec06d7cafa7871b59ecf3ef1584102239d.camel@mailoo.org>
Subject: Re: [PATCH v5 00/12] leds: Fix/Add is31fl319{0,1,3} support
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Date:   Sun, 31 Jul 2022 19:21:39 +0200
In-Reply-To: <20220712100841.1538395-1-vincent.knecht@mailoo.org>
References: <20220712100841.1538395-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello !

Any chance getting this series merged for next/5.20 ?

Thank you


Le mardi 12 juillet 2022 =C3=A0 12:08 +0200, Vincent Knecht a =C3=A9crit=C2=
=A0:
> v5:
> - added and tested Andy' series which converts driver to use
> =C2=A0 device properties, dev_err_probe, devm_add_action_or_reset
> =C2=A0 and simple i2c probe_new:
> =C2=A0 https://lore.kernel.org/linux-leds/20220711213524.3587-1-andriy.sh=
evchenko@linux.intel.com/
>=20
> v4:
> - took Andy's comments into account
> - add patch 7 for cleanup and formatting fixes
>=20
> v3:
> - pick up Rob's R-b for patches 1 and 2
> - reinstate bindings docs license and maintainer
> =C2=A0 changes with Nikolaus agreement
> - took Andy's comments on patch 4 into account
>=20
> v2:
> - keep original bindings license and maintainer/owner (Rob)
> - squash bindings patches 2 & 4 (Krzysztof)
>=20
> v1-resend:
> - no change, resending after configuring git to accomodate
> =C2=A0 for smtp provider limit of 5 emails per batch
> - just change cover-letter to mention si-en chip for idol347
>=20
>=20
> The is31fl3190, is31fl3191 and is31fl3193 chips (1 or 3 PWM channels)
> cannot be handled the same as is31fl3196 and is31fl3199,
> if only because the register map is different.
> Also:
> - the software shutdown bit is reversed
> - and additional field needs to be set to enable all channels
> - the led-max-microamp current values and setting are not the same
>=20
> Datasheets:
> https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
> https://lumissil.com/assets/pdf/core/IS31FL3191_DS.pdf
> https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
> https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
> https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf
>=20
> This series:
>=20
> - converts dt-bindings to dtschema, adding all si-en compatibles
> =C2=A0 for convenience and consistency, and adding constraints on
> =C2=A0 supported values for eg. reg address and led-max-microamp
>=20
> - changes vars, structs and defines to not use 319X suffix
> =C2=A0 but 3190 for 319{0,1,3} and 3196 for 319{6,9}
>=20
> - adds fields in chipdef struct for chip-specific values
>=20
> - only in patch 6, adds is31fl319{0,1,3} specific values
> =C2=A0 so those chips can work.
>=20
> - patch 7 cleanups parts non touched in previous patches
>=20
> - patches 8 to 12 are Andy's to modernize the driver
>=20
> Tested on msm8916-alcatel-idol347, which probably has an
> si-en,sn3190 or si-en,sn3191 (only one white led indicator).
>=20
> Andy Shevchenko (5):
> =C2=A0 leds: is31fl319x: Make use of device properties
> =C2=A0 leds: is31fl319x: Make use of dev_err_probe()
> =C2=A0 leds: is31fl319x: Fix devm vs. non-devm ordering
> =C2=A0 leds: is31fl319x: use simple i2c probe function
> =C2=A0 leds: is31fl319x: sort header inclusion alphabetically
>=20
> Vincent Knecht (7):
> =C2=A0 dt-bindings: leds: Convert is31fl319x to dtschema
> =C2=A0 dt-bindings: leds: is31fl319x: Document variants specificities
> =C2=A0 leds: is31fl319x: Add missing si-en compatibles
> =C2=A0 leds: is31fl319x: Use non-wildcard names for vars, structs and def=
ines
> =C2=A0 leds: is31fl319x: Move chipset-specific values in chipdef struct
> =C2=A0 leds: is31fl319x: Add support for is31fl319{0,1,3} chips
> =C2=A0 leds: is31fl319x: Cleanup formatting and dev_dbg calls
>=20
> =C2=A0.../bindings/leds/issi,is31fl319x.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 193 +++++++
> =C2=A0.../bindings/leds/leds-is31fl319x.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 61 --
> =C2=A0drivers/leds/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/leds/leds-is31fl319x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 533 +++++++++++---=
----
> =C2=A04 files changed, 537 insertions(+), 252 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/leds/issi,is31=
fl319x.yaml
> =C2=A0delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31=
fl319x.txt
>=20



