Return-Path: <linux-leds+bounces-779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065784DE79
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 11:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2DFB2C2CC
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEB16EB46;
	Thu,  8 Feb 2024 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQaLrSwF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C576DD1C
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387824; cv=none; b=W+TR+G1U7fCbhdpn1ofxnibIdaPbISOUqIpO6MVodZ3ApnI+GiE/xqGDSnVgaF0jgEuU3pGGvpfzp7OPva/br7lHo+HGIQ4gzBtM9nMai60gXUvBHptk01Z1B+Wvujhb2f0IYZswpLRnatEpDhb8l/lY22r7svV/XsEWnwVBp/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387824; c=relaxed/simple;
	bh=Ez682FjzrLN7xWUEoLgcMSJ+H3u7Qlxe28AF3ikRukg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqbenM+F/23qw6PYcryuust+IJMakwLs6T2ycm37KFFNMFeRYewb0oKojlNJdCTCw+I1Ffpp7Iv198ypLntgyKDrVt9LfnzdzxJNSF/c1IVhWgj5gvXZazXkbQ9B5UWMxtG6dQmigKw3JOBHZtXT+cAchyv6UvCuLrhMsmMM6WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQaLrSwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13636C433F1;
	Thu,  8 Feb 2024 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707387823;
	bh=Ez682FjzrLN7xWUEoLgcMSJ+H3u7Qlxe28AF3ikRukg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQaLrSwFyzrto+/Bui+d3Y+EEeUzSG38wk+Gxgb+eU7bS8JomPzuhiJBwzKF4Xi1g
	 WNvt6zaG/oK4el9NwX0GyuX3rAmG2aHpjynKLL/hcL91F++ikYaZMCISD+kMwxeN3j
	 7u2fodd9PLKA7X5wKrOnHRtF9ABU5aSJ89nLBx4COelDH9EyMgBcHqGnEF0JI/ZYoK
	 /gY9UU5UE0N3YHsw7Z9KyMkQffSo6Ve67r8xd4O0BI3OLXD+fiN5KiQP3dni9rOLiH
	 CRvhIMpnabk2W9AA8ZlXqEx2H4wUxwK9vQZ9FQQ3qidgvEBTR+beKMEvEFt8gb6kFZ
	 l+wpNF2f3vgCA==
Date: Thu, 8 Feb 2024 10:23:40 +0000
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH] leds: trigger: stop exporting trigger_list
Message-ID: <20240208102340.GE689448@google.com>
References: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
 <170738775519.907987.8656098604510646583.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170738775519.907987.8656098604510646583.b4-ty@kernel.org>

On Thu, 08 Feb 2024, Lee Jones wrote:

> On Wed, 31 Jan 2024 15:30:53 +0100, Heiner Kallweit wrote:
> > 682e98564ffb ("leds: trigger: panic: Simplify led_trigger_set_panic")
> > removed the last external user of variable trigger_list. So stop
> > exporting it.
> > If in future a need should arise again to access this variable, I think
> > we better add some accessor instead of exporting the variable directly.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] leds: trigger: stop exporting trigger_list
>       commit: 6171582edb46889769d994cca81cf0f0fdd8c66f

I fixed the chechpatch.pl error for you and changed the subject line to
match the format expected by the LED subsystem.  Please correct these
yourself in subsequent contributions.  Thanks.

-- 
Lee Jones [李琼斯]

