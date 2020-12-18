Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6222DE301
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 14:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgLRNAk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 08:00:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41918 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgLRNAk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 08:00:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 23FBA1C0BB9; Fri, 18 Dec 2020 13:59:58 +0100 (CET)
Date:   Fri, 18 Dec 2020 13:59:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Xiaoming Ni <nixiaoming@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com, akpm@linux-foundation.org, keescook@chromium.org,
        gpiccoli@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        wangle6@huawei.com
Subject: Re: [PATCH 2/4] hung_task: Replace "did_panic" with is_be_panic()
Message-ID: <20201218125957.GA20160@duo.ucw.cz>
References: <20201218114406.61906-1-nixiaoming@huawei.com>
 <20201218114406.61906-3-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20201218114406.61906-3-nixiaoming@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-12-18 19:44:04, Xiaoming Ni wrote:
> Replace the global variable "did_panic" with is_be_panic()

Changelog does not match patch.

Plus.. is_being_panic is not really english. "is_paniccing" would be
closer...?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9ynzQAKCRAw5/Bqldv6
8gBWAJ4w9z9cR/CwGT7qi74NHBos3ww9AgCeIVfjmxPr9VOsZgI9R0Y9Isb3Kps=
=nYfN
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
