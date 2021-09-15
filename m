Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5915F40BCEA
	for <lists+linux-leds@lfdr.de>; Wed, 15 Sep 2021 03:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhIOBLw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 21:11:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:50170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhIOBLv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 21:11:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC5B36115B;
        Wed, 15 Sep 2021 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631668233;
        bh=6JjqhFhlD78+2xi13oa2w4fKo5XUiX8v6a7aF8Sbnuc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I4zAEYrKvyfyQepeY2ePCU/E0JWsPjabYtUu2X8Pja1+0R8qzfQbAvBtz9CdP+4St
         OeSE24ICZi3Qf4MGkfsc4+8cnRmAGnm5xCR26XLP4G4vnG3kIi1BJC2W7g+AFC8Xvf
         eSW6QG3DGFyux0TTz5sjWbsHzcoOIGpVTYPRv6BbVzw1KKi+8iXAT0ZVkpALiTjgjN
         EEbkd+4ebWFh9qEAh5pnd2vplC1CbUmHxslpwHoyOC5EIxl31mLhdDPbJCsOf0ruTd
         XGo+gdJ31UykBq4ucij09iEM5G7Ao/nwYhJ1HN30ybySokewrugFXXuLhpX7mK5WHO
         BvIZ8qMs59n/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YUEbaEzKT+cCYk9z@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-6-robh@kernel.org> <163164958886.763609.7483570624844319215@swboyd.mtv.corp.google.com> <YUEbaEzKT+cCYk9z@robh.at.kernel.org>
Subject: Re: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset' for register address
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
To:     Rob Herring <robh@kernel.org>
Date:   Tue, 14 Sep 2021 18:10:32 -0700
Message-ID: <163166823242.763609.3525207812474759296@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Rob Herring (2021-09-14 15:00:08)
> On Tue, Sep 14, 2021 at 12:59:48PM -0700, Stephen Boyd wrote:
> > Quoting Rob Herring (2021-09-13 12:28:13)
> > > The ICST binding now also supports 'reg' in addition to 'vco-offset' =
for
> > > the VCO register address. Add support to the driver to get the VCO
> > > address from 'reg'.
> > >=20
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-clk@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >=20
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> >=20
> > I don't think this driver is changing much so you can take it through DT
> > tree if you prefer.
>=20
> clk tree is fine. :)
>=20

Alright alright
