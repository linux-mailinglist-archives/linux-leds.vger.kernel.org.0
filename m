Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCEACC1EC
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 19:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387988AbfJDRmm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 13:42:42 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33848 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387428AbfJDRmm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 13:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SAkQpxESi/jK/m+F0rStFnkhrz33ICzQ+DcDMRtBMOc=; b=okGkzQUW1797du/qbiyU6EyTw
        kqBvY+MybQMETrMgtajMpbz4dL/mwe/X9jSDkTvVk0+l1N+Z0BcM9MBpoS8fxIe58uQ5iGsTmDPHy
        +kBUdi0rmHeK/AmZLnqHWshr8L32Qcfu5Hm4ideAmeVG2xuJKILTkT2bJgwei093dPNSE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGRb8-0003s3-Gr; Fri, 04 Oct 2019 17:42:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 78CA62741EF0; Fri,  4 Oct 2019 18:42:33 +0100 (BST)
Date:   Fri, 4 Oct 2019 18:42:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     mark.rutland@arm.com, daniel.thompson@linaro.org,
        Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com
Subject: Re: Should regulator core support parsing OF based fwnode?
Message-ID: <20191004174233.GF4866@sirena.co.uk>
References: <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
 <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
 <20191004155838.GE4866@sirena.co.uk>
 <95a43632-57d0-2705-a2d3-d64827212692@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline
In-Reply-To: <95a43632-57d0-2705-a2d3-d64827212692@ti.com>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2019 at 06:12:52PM +0200, Jean-Jacques Hiblot wrote:
> On 04/10/2019 17:58, Mark Brown wrote:

> > Regulator supplies are supposed to be defined at the chip level rather
> > than subfunctions with names corresponding to the names on the chip.

...

> > good chance that they come up with the same mapping.  The supply_alias
> > interface is there to allow mapping these through to subfunctions if
> > needed, it looks like the LED framework should be using this.

> In case of current-sink LED drivers, each LED can be powered by a different
> regulator, because the driver is only a switch between the LED cathod and
> the ground.

Sure, it's common for devices to have supplies that are only needed by
one part of the chip which is why we have the supply_alias interface for
mapping things through.

> > That said if you are doing the above and the LEDs are appearing as
> > devices it's extremely surprising that their of_node might not be
> > initialized.

> That is because this is usually done by the platform core which is not
> involved here.

The surprise is more that it got instantiated from the DT without
keeping the node around than how it happened.

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XhIgACgkQJNaLcl1U
h9Ax0wf7BtlHwZ3DGTnXuJN85FVOLdmgDfERGDVQS+pR3WFG/BLI42EXa+OfXl6S
VF7r82YlzCBgY4z9Qm+DXbEkxdRyYzDu+fXp7iT/gEpuN8tS+y/vEAlfz8TVxbmi
P1cNkSnXcO4kKFGwW6mzVKOWE9Odxw1kFu0srade53RfiIC0xhXGafHXplRiIM+7
2saUeJgmWDYsOAcSO7IBvnoicuXNOn0+FPV9O+Raj+1vw5BCD6wJGdbCQPI+OYSl
DfaR1UmYKJkXH5wCjCHsaAkMI3Y/1u04Xoik5Y2cle8e1DdE6w1a/vzIEhLIqup2
Nzc07kK12LcFNNRdcqE4MiRNMNpS+Q==
=FQdn
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
