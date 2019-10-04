Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE98CB951
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 13:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbfJDLju (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 07:39:50 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44784 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDLju (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 07:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uxkER/QipwAak3j6xLb6XLIxFP8Zl0rvqGk64ybuFnk=; b=XkhiTwr9rNVXDBGU85RAUGh/z
        V9hc/cYKA7+fP3dgX1OOfE7x1jAzO5iZx+bMl1C205sdm87GEwuLPWSiRd5HQdDbT9L7XT9OvfEIP
        JxNgmR+utm/pQV7O9LhM4X9+d2+8VhWkj+CT5JurPuBL18Vcpz4S9wUZWTTSbo+wIoIlM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGLvz-0001uM-AQ; Fri, 04 Oct 2019 11:39:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 887BE2741EF0; Fri,  4 Oct 2019 12:39:42 +0100 (BST)
Date:   Fri, 4 Oct 2019 12:39:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        lee.jones@linaro.org, daniel.thompson@linaro.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Should regulator core support parsing OF based fwnode? (was: Re:
 [PATCH v8 2/5] leds: Add of_led_get() and led_put())
Message-ID: <20191004113942.GB4866@sirena.co.uk>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 10:27:26PM +0200, Jacek Anaszewski wrote:
> On 10/3/19 9:41 PM, Mark Brown wrote:

> > Why would we want to do that?  We'd continue to support only DT systems,
> > just with code that's less obviously DT only and would need to put
> > checks in.  I'm not seeing an upside here.

> For instance few weeks ago we had a patch [0] in the LED core switching
> from using struct device's of_node property to fwnode for conveying
> device property data. And this transition to fwnode property API can be
> observed as a frequent pattern across subsystems.

For most subsystems the intent is to reuse DT bindings on embedded ACPI
systems via _DSD.

> Recently there is an ongoing effort aiming to add generic support for
> handling regulators in the LED core [1], but it turns out to require
> bringing back initialization of of_node property for
> devm_regulator_get_optional() to work properly.

Consumers should just be able to request a regulator without having to
worry about how that's being provided - they should have no knowledge at
all of firmware bindings or platform data for defining this.  If they
do that suggests there's an abstraction issue somewhere, what makes you
think that doing something with of_node is required?

Further, unless you have LEDs that work without power you probably
shouldn't be using _get_optional() for their supply.  That interface is
intended only for supplies that may be physically absent.

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XL30ACgkQJNaLcl1U
h9Bl/Af/YOdwSUwNR5lUVgKAFW2pr2ik2c3HTxDJRohY7d7c9SAjDU0BMEXYIPFM
eC0e7q+wlO+6BS603W/HM+P0a5vIBN6s/THgmPZI9ZqkCf/yfDMcrZvBrkZgihie
eHb0vUpC9r+PYo2YLAXIB2SPav+9hrMm9sy9PFTbzAD1rzIfoNjrjDgPcrQDZnBD
82toS6OhmV2ycspOQIk0j4Y97n7FoFnW/YcT43Qu1LqHVYv7mVoS6VcRMlmlUCAh
g2XNf42osnLjTWk1to+LFx3a3I+u6PkBFXOxvBukXXhx5w2GpZDb8auZiKliGe9U
XiA9FkkaTcFWIJjx861STbwGn0CRSw==
=7d+U
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
