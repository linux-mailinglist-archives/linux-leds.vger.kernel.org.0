Return-Path: <linux-leds+bounces-4078-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC989A44A51
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 19:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F1B188CD29
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 18:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3951FC7DA;
	Tue, 25 Feb 2025 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e58QKnME"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED51F4177;
	Tue, 25 Feb 2025 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507942; cv=none; b=jB6945nNW70iIHEPtNSzmYGFuxHPkb8Opm4w6hFbL70EP2RYNUZbS7xP3wAcNiUI8mUs1oTiUUAnVBy9RRNxj01lf43Kuz3XQBnANRSK71ghG5xT4WOdfCF6BxDSHRvzBjlA4ahUVHTnQboDoe/37HMXnIqAzIg4+I9wKnEWHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507942; c=relaxed/simple;
	bh=FI4npKmJzzOhR1wCpGxwR49Q+jIScuTUHT5YRTQ/ivI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XIpQTiHUWdV19gytdsVswnKNHahSmS9U4+VrPaZIcfVI+zXLXV+03XC4dks9g7LLAOOJbh7DCQ+qQ4FO04O2pRy++bfPi7dyDPiFtLe7+8knNHd+ktpiA8mpqY1bR/UkhHBAeFGHw684lOdlYsOdjCh8vgpAFg3STeb3wboK0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e58QKnME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F5C4CEDD;
	Tue, 25 Feb 2025 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507941;
	bh=FI4npKmJzzOhR1wCpGxwR49Q+jIScuTUHT5YRTQ/ivI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=e58QKnMEpZZKN6nblA3HDiCdV03Ctn0C1iZ2O0Y5LB1nSJXWlGMuir4BBQUVf6FVn
	 OY1bVsgPKOKeWMpwnrDqvmyxFeoKN0Wn9nKn1FqLshhZON087DmmRAC+GeCNmhEpLW
	 AuySps3tktYI77AAVmXF/VUcWkbixdSWPsX7l5m2mrEglugfGAbFZMDg029umBF1ZJ
	 DjotcfDjD1d0BjkATvgF+JVm3RNVYN9UV93cIhjPa/BX0doaCwYy3saY/xrvKpqU01
	 KNpjgg4h1uHrH0OiBVokBwSRCb0uonivoIdKGyxJ1UILiANScz5ZTDepKGMDoNdbrs
	 N+4nVCucGg6Ng==
Date: Tue, 25 Feb 2025 12:25:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, pavel@kernel.org
To: Nam Tran <trannamatk@gmail.com>
In-Reply-To: <20250225170601.21334-2-trannamatk@gmail.com>
References: <20250225170601.21334-1-trannamatk@gmail.com>
 <20250225170601.21334-2-trannamatk@gmail.com>
Message-Id: <174050793997.2798870.5121158567249735734.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LP5812 LED driver
 bindings


On Wed, 26 Feb 2025 00:06:00 +0700, Nam Tran wrote:
> This documentation ensures proper integration of the LP5812
> in Device Tree-based systems.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 34 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/ti,lp5812.yaml:4:1: [error] syntax error: expected '<document start>', but found '<block mapping start>' (syntax)
./Documentation/devicetree/bindings/leds/ti,lp5812.yaml:6:13: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/ti,lp5812.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/leds/ti,lp5812.yaml:4:1: expected '<document start>', but found ('<block mapping start>',)
make[2]: *** Deleting file 'Documentation/devicetree/bindings/leds/ti,lp5812.example.dts'
Documentation/devicetree/bindings/leds/ti,lp5812.yaml:4:1: expected '<document start>', but found ('<block mapping start>',)
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/leds/ti,lp5812.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250225170601.21334-2-trannamatk@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


