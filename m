Return-Path: <linux-leds+bounces-3222-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E189B7FB5
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A221C1F21BA7
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904F21A2C15;
	Thu, 31 Oct 2024 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM7cDB1k"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364519DF49;
	Thu, 31 Oct 2024 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391139; cv=none; b=FaQiEaF/lx49tZunLwUYjb2AuVmMEAMlfI6qbX8Tl1p3Nv4764b6LOZ2UyP/KvR8kkbUXLe5uedVDhmmhJl77q2VA1TAUVTBrSVI5pt0M5PocFYGI9cqReIXKvt2PsA3s6JDIdVkU6AVmWeclxKuXiY3Q7uodmSoaq1QergmpY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391139; c=relaxed/simple;
	bh=MY/hoDwp6W/pd8Z5Djsa3d6zFgEXmmIbebao0o71+Gw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MGRaxhhjonjAj3gfnuSumOeOKlOEFxQX03gRKDWT6RjCSlUKqeuUhtVGm+jmklgm+CAjrKRr1miD/BlgiGLXM4Uz24lmnIhgZRaSKMBt6M7FvO4QfomN9HEYLMFvgFavq9BwzHHC8PM3WtRa9KgQg5eGpfpohRboK93cpXObaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM7cDB1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7242DC4FF7A;
	Thu, 31 Oct 2024 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391139;
	bh=MY/hoDwp6W/pd8Z5Djsa3d6zFgEXmmIbebao0o71+Gw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZM7cDB1kUrrMUJLsfVWJIe8JPP43Y8Stxp1QuXV1C/M579XnLz1nF86lGLIXVPKbu
	 s79IDSdZRrmOJabM50Yz28IM47t9CfQPA0hfSQ8JTMJgBp6s4JWaWHmrlIcGqfO1Qs
	 rosEB7HFhsctGSXkPi2z69bvDmIoFZfuGitHAy0+IvUmsSwAgh+11hl1hNpQz8NxbM
	 POF9TA4xibX1Mzdyk/NY6HKjpUfNc8z2uMVI3PLB+O2g4zBaajw9CKgpBhRynPgQoT
	 Yq1Sv0/duDIma2F5mhjCJnVHoF09K2XVnndjFrbkHJa56aWAP/RSH6EJzsGCuqZacH
	 yy/oyzs1TrbeA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241019-max5970-of_node_put-v1-1-e6ce4af4119b@gmail.com>
References: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
 <20241019-max5970-of_node_put-v1-1-e6ce4af4119b@gmail.com>
Subject: Re: (subset) [PATCH 1/2] leds: max5970: fix unreleased
 fwnode_handle in probe function
Message-Id: <173039113720.1798167.5364741747242416515.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 16:12:17 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 19 Oct 2024 21:36:43 +0200, Javier Carrasco wrote:
> An object initialized via device_get_named_child_node() requires calls
> to fwnode_handle_put() when it is no longer required to avoid leaking
> memory.
> 
> Add the missing calls to fwnode_handle_put() in the different paths
> (error paths and normal exit).
> 
> [...]

Applied, thanks!

[1/2] leds: max5970: fix unreleased fwnode_handle in probe function
      commit: 42c04062ba3cd1f2aef96dc160e0ab4b45b5e10a

--
Lee Jones [李琼斯]


