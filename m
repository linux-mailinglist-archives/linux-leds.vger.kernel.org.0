Return-Path: <linux-leds+bounces-4326-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD7A6AA4E
	for <lists+linux-leds@lfdr.de>; Thu, 20 Mar 2025 16:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F58E1887133
	for <lists+linux-leds@lfdr.de>; Thu, 20 Mar 2025 15:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBAB1E9B0F;
	Thu, 20 Mar 2025 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUT6uO7d"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36C1E5201;
	Thu, 20 Mar 2025 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742485817; cv=none; b=HjTWKUvRRZJxewMGj7wEFvw9lDwpL/tFE7NT1lNYCzITps0Q8I1dBVkGCozUQwX4gYwHPvxgUnMER1g0/b+sjHdNFIWJGljq7jzwnNsoKSVFgjgAkVAc4QzO82RBPTQh4IhYiGS5+CfHz9Q6EFMfol1LEq8XxitG5SmL/48seFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742485817; c=relaxed/simple;
	bh=pyAJ9pTMRfAZijv4b+LgLfdzavNILKNsBgVkyl/TfU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7hxYHpWiFOpt+8vILtJhl7G7+iu5QWVpXpJuwbrD4q67XveKHSw82Xj5qpAuBwvWkmb9jWb39iIwrRY+iux52qmvFospkS4uoaqtlM1EUXu9PHZI37CdQmS3ky57Kz93XcuKVFC+UcheTpcBc8uFLB4QDf3KygML0ncXUgRo5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUT6uO7d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E14C4CEDD;
	Thu, 20 Mar 2025 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742485817;
	bh=pyAJ9pTMRfAZijv4b+LgLfdzavNILKNsBgVkyl/TfU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUT6uO7d+E+EbjUhPjhUvxl1mK288J+YHWF5YEAgeHdcT+mk+FpA39s3fLwcotEV8
	 otjDqPlKZ8NBq17P5ETmKkV4zEWjSkaO1+/Z8N5vxbZfBEqMk91I0TBfHoad8sf8oZ
	 fQb52G4oaiUSMcSbGT0ZANhf8IcZ4YU4HWzNLiZdQ020oF7kdutrWKp+YOb7cN35aj
	 MQiNZ1Akm2pc+TF4WrRvb//mtkZn0ZYjtSXr7A+nq2PAX7CNlmozVroQ76tGC0HMmz
	 eN/oEZ+0wKHLYtnXFzIfsQIakvIU5ZlSqjKlG524z9ICOcsX4DFlVbcdTWDOozEaDg
	 TovGf/lWmzHuw==
Date: Thu, 20 Mar 2025 15:50:12 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: krzk+dt@kernel.org, pavel@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Message-ID: <20250320155012.GT3890718@google.com>
References: <20250306172126.24667-4-trannamatk@gmail.com>
 <20250318133508.4531-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318133508.4531-1-trannamatk@gmail.com>

On Tue, 18 Mar 2025, Nam Tran wrote:

> From: Nam Tran <trannamatk@gmail.com>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org> Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
> 
> I sincerely apologize for not addressing all of your previous comments earlier. That was not my intention, and I truly appreciate the time and effort you have put into reviewing my patch. Below, I would like to properly address your concerns.
> 
> On Fri, Mar 07, 2025 at 12:21:26AM +0700, Nam Tran wrote:
> > The chip can drive LED matrix 4x3.
> > This driver enables LED control via I2C.
> 
> You still did not respond to comments from v1. I don't see it being addressed.
> 
> Nam: I am sorry. This is my mistake. I think that I just need to update source code based on your comments and submit a new patch. This is the first time I try to update a new thing to the Linux Kernel. I will give answer inline your message for tracing easily.

For the record, I find this format pretty unreadable.

Please reply directly to the email you are responding to.  This response
looks as though you're replying to the patch itself.

Configure your mailer to refrain from placing header information (To:
Cc: From: etc) in the body of the mail.

If your mailer conducts quoting correctly, there should be no need for
"Nam:" comments.  For me it looks as though you authored both the review
comment and the response, since your mailer currently does not handle
quoting correctly.

It would help everyone out if you could configure your mailer correctly.

Maybe this document has additional hints for you particular mailer:

  Documentation/process/email-clients.rst

-- 
Lee Jones [李琼斯]

