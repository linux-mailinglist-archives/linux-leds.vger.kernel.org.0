Return-Path: <linux-leds+bounces-1144-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A7872227
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 15:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE8D1C20CAB
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 14:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4BC85954;
	Tue,  5 Mar 2024 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMV/IPIi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E436127;
	Tue,  5 Mar 2024 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650690; cv=none; b=YtrTOJgA2NLFBRbPsADKSrLDkBxvTZHjMqXIgP4b8n7L/+4nr+MjUFN83ueabV8uGgibx21sX+HIqtornzVshpcrrle/sX0Sh/0aAcoWt1V81+Ad9oja3ICmFjMDOg3Mcz92XqU8QWPs+r8PPM2twXMMQfrdj1k9mNKfvCHTOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650690; c=relaxed/simple;
	bh=5tTa2klhYMWHq8lUEeeemWvJqaukbxalol602fj3tfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ITw2vuP3yLN6DRgNTVAhyYHo1iQoEfDZbnQYpme4Tcat2NEOn0uJinCkdaqe4MdUqlJRjVH8dcI0BgsJeZeTayo8gd2vwTy35UrSESwJUZJkYzNWlIm0O+6z/500k2/SmQSKZGVfU8QvzU+Iuvogmrz/mtxfWt83QOCyf2csebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMV/IPIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D146FC433F1;
	Tue,  5 Mar 2024 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650690;
	bh=5tTa2klhYMWHq8lUEeeemWvJqaukbxalol602fj3tfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MMV/IPIiVmSTrgBnAe33PjJi6JvTYrKer8uxrryhdjcqB7CBmJ3NrX8KeFfF+h/ug
	 gZKXkIlHTwmlSicwDo9DHhSA32RRTIfB/6JYqZ0ycXX3UWvOpNWJ4xiay1CAMH+28B
	 7PHrTXthh99FrED72kmeu4DwS4GUVZV1xQo+v9qBcoOJyUY5pY9ShPyXESPn74wo7g
	 lP2gwhPCmQbdB+94/XuMcoLBv84UmFKj1MDvvivCmmm2o/+jo5iVlNQ7ysmXKOuLpZ
	 mRQUJ4idohhgMV0TUctJhl8MzSfsCwANxB9v7rmwDXdW7DVvJIFX8dRUpgtJqdrkP9
	 H3HxfYWjIy4ZQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Abdel Alkuor <alkuor@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240305133824.1551809-1-alkuor@gmail.com>
References: <20240305133824.1551809-1-alkuor@gmail.com>
Subject: Re: (subset) [PATCH] leds: ncp5623: Add MS suffix to time defines
Message-Id: <170965068852.202117.1996745150846307300.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 14:58:08 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Tue, 05 Mar 2024 08:38:17 -0500, Abdel Alkuor wrote:
> To make the time macro defines clearer, add MS as a suffix.
> 
> 

Applied, thanks!

[1/1] leds: ncp5623: Add MS suffix to time defines
      commit: fced824b08eac94d640ba2d19f409b95f5b3b0e3

--
Lee Jones [李琼斯]


