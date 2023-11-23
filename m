Return-Path: <linux-leds+bounces-126-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24827F65C0
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 18:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE559281C6A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F71841233;
	Thu, 23 Nov 2023 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGlA4O2m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A34122E
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 17:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBB9C433C7;
	Thu, 23 Nov 2023 17:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761654;
	bh=G6fzjX1GbRtb7Su9/jaitT87KthKO3fzQSb2k71GPoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eGlA4O2miieWtiZgXDBCsk5FOyFJaf9z8PdL+HpdA4DMbjbpfJOUjjzANl1GvM9Ul
	 0TDU61cxEBC/fd7+UGv4gpl1cQRf7+kHVBnW+5amyB+/xRg73o10mMMoc25gbLNLZn
	 AxQwI7isHtpIEXRBl3ywn8tU2v/bqfl9QSSBVprRkBTStsC2RsMIuzVVIzWx4WyBWH
	 71ixs7aFWhJpUIDq/u22E1uu/l8FSkaLfS5pde3BOYaArBeGJr4RhJRlN8PaDPPAad
	 UdzNhAwXTq+Jhr2wnDY6oPS0NyxSR8SR7G7MVMn6j7nAYEedN8fZGDOiGShOlrlB5u
	 KQ1ecGkOiqLNA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Naresh Solanki <naresh.solanki@9elements.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20231123132803.1107174-1-naresh.solanki@9elements.com>
References: <20231123132803.1107174-1-naresh.solanki@9elements.com>
Subject: Re: (subset) [PATCH v5] leds: max5970: Add support for max5970
Message-Id: <170076165290.1472423.16438293680293948844.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:47:32 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 23 Nov 2023 13:28:02 +0000, Naresh Solanki wrote:
> The MAX5970 is hot swap controller and has 4 indication LED.
> 
> 

Applied, thanks!

[1/1] leds: max5970: Add support for max5970
      commit: 8171710be2d04fdc263da49212d7b875d3688f58

--
Lee Jones [李琼斯]


