Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD50131FE93
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 19:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhBSSJZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 13:09:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33048 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhBSSJW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 13:09:22 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5B9D41C0B98; Fri, 19 Feb 2021 19:08:40 +0100 (CET)
Date:   Fri, 19 Feb 2021 19:08:39 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V1 0/2] Fix WLED FSC Sync and brightness Sync settings
Message-ID: <20210219180839.GB8596@duo.ucw.cz>
References: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The FSC (Full scale current) setting is not updated properly due to the
> wrong register toggling for WLED5. Also the ILED_SYNC toggle and MOD_SYNC
> toggle sequence is updated as per the hardware team recommendation to fix
> the FSC update and brightness update issue.

If this is phone hardware, it might make sense to cc:
phone-devel@vger...

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC/+pwAKCRAw5/Bqldv6
8v0PAJ9ISDz0UXnceiQ5xhbRxHROiNEIPQCeLTRKWGIGaXXN9i9uX3Wdz5F1rXw=
=ujV2
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
