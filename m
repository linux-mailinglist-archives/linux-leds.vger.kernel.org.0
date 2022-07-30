Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EB6585C33
	for <lists+linux-leds@lfdr.de>; Sat, 30 Jul 2022 23:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiG3VBe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 30 Jul 2022 17:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbiG3VBd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 30 Jul 2022 17:01:33 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455E514011
        for <linux-leds@vger.kernel.org>; Sat, 30 Jul 2022 14:01:33 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 193501C0001; Sat, 30 Jul 2022 23:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1659214892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jpQas4j3Oi1K/35xTYH3DAAT3tFYUOmfIDu7w5m0GDs=;
        b=h/mf/gEyB4vVF9mIjVmkOu81wcYiBvkJAOpk2SY4LsAjliz4pkzDSIBxb73h0EbQtKhMp9
        yw601acC0sJKRwYiVFfNqS1rezk0Yy+3BLJkMi/+CLp3cAf3LCFQYoQO75c/XBYKtW3sHO
        4IGoo5Qt2SNkFQeTMLwoJU5y2THK8qI=
Date:   Sat, 30 Jul 2022 23:01:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: DT bindings patches for LEDs
Message-ID: <20220730210131.GD23307@duo.ucw.cz>
References: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
 <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2022-07-21 12:55:43, Rob Herring wrote:
> On Thu, Jul 21, 2022 at 10:25 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Hi Rob,
> >
> > It seems Pavel is recently quite busy [A] and few DT bindings patches
> > are still pending. Maybe you could pick up instead:
>=20
> Is Lee picking up things?
>=20
> >
> > 1.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/202206070=
75247.58048-2-krzysztof.kozlowski@linaro.org/
> > 2.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/202207211=
60611.250274-1-krzysztof.kozlowski@linaro.org/
> > 3.
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/202207190=
74542.24581-1-krzysztof.kozlowski@linaro.org/
>=20
> Applied all but this one. It depends on de40c8496ead ("dt-bindings:
> leds: class-multicolor: reference class directly in multi-led node")
> in Pavel's tree. I can apply in the merge window or after rc1 if
> Pavel/Lee does not.

Thanks for patience. I took this one, I'll drop others dt-related from
Krzysztof from my inbox.

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuWcKwAKCRAw5/Bqldv6
8hUHAJ9DX67q1fgvHXKC+Zp61GaQFYdOzgCgrXBVwu/m0ZAbmb6UaRMCUrNyPG4=
=GSXR
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
