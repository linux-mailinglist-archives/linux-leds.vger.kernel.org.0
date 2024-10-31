Return-Path: <linux-leds+bounces-3219-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EE9B7CF7
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 15:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39CD21C215DF
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 14:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397B1A0BCF;
	Thu, 31 Oct 2024 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/C47Owa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACB1A0BC0;
	Thu, 31 Oct 2024 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385251; cv=none; b=kii5H3sEQ9QyOJWPeSewVGzy9Py/fPqPh9/t7Gai7WsLmL2OVVOc7nvZu4bMeybgJpLcogBPzwPETOxHIQtAAfGzzkw6DaFtbMEV1CLNqFLla5O5rr/XaoVxhbmTcD+nkLM2lqls7BJND5YxiHxps/lMwV369rttYOz4uu7I3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385251; c=relaxed/simple;
	bh=Eui3ethxSlEgxCl86EqH5S3O3+udHE03eH0J6r5d8KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ueAh5yMg7NFn1t8fBBWtH/25lIcEksCmXZ0UpsDUlo3TJcmu5MZPvMbnJLSCBWCCQSiQ3b/gwTR0lHeFVTCOQlHAdel5d6F290CFLJtt0+EoJujt5s4xLoF/U1Nq6DN6yQNopooMcl4Kfa7yymx82Pand7w4KSA7LYNh82ZPk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/C47Owa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4557C4CEF5;
	Thu, 31 Oct 2024 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730385251;
	bh=Eui3ethxSlEgxCl86EqH5S3O3+udHE03eH0J6r5d8KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g/C47OwaDx3K6qOuB6XVIcrwvPRggreqvwdHEIL2J7as+ft0Hb57YCpQheBGx1jna
	 CC7axoH2Dh8J/hROjIvQt9t3GPWYjGY+FDWlLPAu8XugdG2/2Ht8/U0qruPoYsPdnG
	 6OrN2wEuKdC3Rfr6fnww7G8edA27HLep6mrLdihkyIEh+WBCbSAYadg7E0a43pdaEj
	 QmfUuZkgzWFbkhCbkTbxWIyTsvy5yvehQ0y+xfRgxXtf46oHpAwSvAR/tONMJrAetC
	 6HwVaK9v1uK8IvKl9G80BDuWmNcQGGOO0XxJqKTsfijspc74wINfkp6KKrX6XBvCmw
	 7W8JKXv4CCvVg==
From: Lee Jones <lee@kernel.org>
To: patrick@stwcx.xyz, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nate Case <ncase@xes-inc.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241016093857.925467-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241016093857.925467-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: leds: pca955x: Convert text
 bindings to YAML
Message-Id: <173038524845.1749832.1023956026809554885.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 14:34:08 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 16 Oct 2024 17:38:55 +0800, Delphine CC Chiu wrote:
> Convert the text bindings of pca955x to YAML so it could be used to
> validate the DTS.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: pca955x: Convert text bindings to YAML
      commit: f92d2e9334171d07b47189397f222f64dcb77617

--
Lee Jones [李琼斯]


