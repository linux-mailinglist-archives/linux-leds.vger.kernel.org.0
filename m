Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70E9585C2F
	for <lists+linux-leds@lfdr.de>; Sat, 30 Jul 2022 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiG3U70 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 30 Jul 2022 16:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbiG3U70 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 30 Jul 2022 16:59:26 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9CF14011
        for <linux-leds@vger.kernel.org>; Sat, 30 Jul 2022 13:59:24 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 949091C0001; Sat, 30 Jul 2022 22:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1659214763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ARAXLP1xi5u/Qz1ccqJkbmYsjjtRbtOYzCwaPcZzNfU=;
        b=VoUErRYJo93IWtdLXI7W8Tcevvp76YSejhe8Mh0A8ahPu4fZGrYsIM1E2RtM+D/uy0t7oG
        vhXd0mkPHxiqSxETwJn8KXYdIkUmSNkRZ9yCw/8Uq2R6GIxeUE3CHLORyED7BygkCl3J2h
        P4onoBb5aFckpqhUVv/xEKnxMNl7QhM=
Date:   Sat, 30 Jul 2022 22:59:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: DT bindings patches for LEDs
Message-ID: <20220730205923.GB23307@duo.ucw.cz>
References: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
 <CAL_Jsq+x-_71earTFhPJZ5ha0iVHx3BeYaiXFY=m3vG4jjtYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
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


--kXdP64Ggrk/fb43R
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

Ok, let me pick this one.

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuWbqwAKCRAw5/Bqldv6
8kYEAKCdQ18oKBPeUX1dUIJhO18nNyN+0wCgp4AJIapLnyLuqCc86FHsYRagpyI=
=4k2j
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
