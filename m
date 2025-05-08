Return-Path: <linux-leds+bounces-4602-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF38AAFC17
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 15:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A99F4E45B9
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CAC22D79A;
	Thu,  8 May 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+Q3Js1g"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51822B5B1;
	Thu,  8 May 2025 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712391; cv=none; b=hm8XVNqCedJJYDuAYDozXBNQ4PDuFbrxgVatmZeC1Ywb3lRRl52hzpTVrLKyNPL4DmuFgqroMetW3Hz/NGygmApqmZWDOzbOvZI8HjItjuwizuH8WwUrRUjMHCmIU2Q/CqlOmyMFGpy/EP7IjV75x7UTS1RBZ/Qy4hkSZRBHSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712391; c=relaxed/simple;
	bh=UfEm4B58ngDULTukNCiVBQo/UK7HFIHkjhGFiZOCm9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LEA94N5fLZmeJ2q+WgaEAylJOawl6arThvfAPiA7ygj5EdVUFbJZ6OkwLeA6Zuz7EIfuBXhRd8qu9xKro7pPgNgkmxT/bysdIc/3UxmdTFng+kkSf1pJFsOoZWW4rMgrwuPiEVAsrUc5FnGfVEOJkLGa2PXqhRtX6ntytOsZy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+Q3Js1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBBCC4CEED;
	Thu,  8 May 2025 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746712390;
	bh=UfEm4B58ngDULTukNCiVBQo/UK7HFIHkjhGFiZOCm9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L+Q3Js1gvJvnK+Q8KxMMgX7H+zdtm+ozOk4SzYW8BlxUc+SRKi8a5c9KZgQrtleB+
	 zL9sqTAt04Gej3qG6pKKFOcDBoEpl0NDdGeGY03+a059yg6rPz+gyfM9unWem/hOys
	 4P6a7hpZhW0aQSDp75bK4wdGdnjc09dlP4u09X0Jw0oDzL6eHvxpOGZe2kDcKb0dtQ
	 gKehjGMJcwNvoIGlRg8vv8QgIv37jNnIPG6ibOvdyYLhKzAfBH2J+kMZO4oSnA9OeX
	 6LEVAoxtPwhKEBKUsaFkj+oyK4gFbTGHfeHJ1TeJ2sn8A5XwVYL/J4oPorvykaLJ9S
	 gRind5wgtntdw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Cc: bettyzhou@google.com, ynaffit@google.com, tkjos@google.com, 
 jacek.anaszewski@gmail.com
In-Reply-To: <20250501081918.3621432-1-lee@kernel.org>
References: <20250501081918.3621432-1-lee@kernel.org>
Subject: Re: [PATCH 1/3] led: led-test: Remove standard error checking
 after KUNIT_ASSERT_*()
Message-Id: <174671238871.2440581.9056606564528432768.b4-ty@kernel.org>
Date: Thu, 08 May 2025 14:53:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Thu, 01 May 2025 09:19:11 +0100, Lee Jones wrote:
> If a KUNIT_ASSERT_*() call ends up in an assertion, the test is marked
> as a failure and the subsequent error checking is never executed, making
> it superfluous.  Remove it for simplicity and to avoid confusion.
> 
> 

Applied, thanks!

[1/3] led: led-test: Remove standard error checking after KUNIT_ASSERT_*()
      commit: ea82d1979ca379b64adf6ee4ca09c2e3f96298e4
[2/3] leds: led-test: Fill out the registration test to cover more test cases
      commit: 025415faccf52ce96dacc462a5bdaebae30079ac
[3/3] leds: led-test: Provide tests for the lookup and get infrastructure
      commit: 2de105202e025c7b8c7c36792363879a773bdb96

--
Lee Jones [李琼斯]


