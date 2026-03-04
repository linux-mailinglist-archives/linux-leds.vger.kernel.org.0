Return-Path: <linux-leds+bounces-7080-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OpYLWAOqGk8ngAAu9opvQ
	(envelope-from <linux-leds+bounces-7080-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 11:50:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8731FE8C5
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 11:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B4730075D3
	for <lists+linux-leds@lfdr.de>; Wed,  4 Mar 2026 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D72372ECA;
	Wed,  4 Mar 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GelU1HtL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C585342535
	for <linux-leds@vger.kernel.org>; Wed,  4 Mar 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621398; cv=none; b=cDwFRebZ8vz0nL9OsCYl/qIBdET4p4N70NRNawAE8ByBzXcy9C7nyyErx7aB0bnvwUgWGfNLqzPkktP2xyC5s7PREAIUWkdad36sK3VsCinjNjF1vrX1w5BnayGJsFCv0QOl/u+/6dHhWyg5dOupuFMDYuGdgsL8wrDSfdXpoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621398; c=relaxed/simple;
	bh=nUzvjH0LRvNaeL428QNicvd0UBoJIOZZN+3eycUan6o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcGrowXkK3Rc8x3PF0qyrL7zfPp4MMDtO/LPRPRs3do/c6DBsK/YHwvr2l+rUR+VdzsZFKKtLBqV3XP94pyZ9+z3NRnJAFKTWeUEqNo2QLjblZb4eaLUihlN9a6oKOtJiNc7RAOTm/RuNRI49V0TOFm1R8350ne/2hsC87hoROs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GelU1HtL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae4816912so44946585ad.2
        for <linux-leds@vger.kernel.org>; Wed, 04 Mar 2026 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621396; x=1773226196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1z581a3c8Mz/0odpr2PMYfWS45knctiwr4B1Quq3vY=;
        b=GelU1HtLxrLSt3yLSiv0An5vTQN4zFjsV/VnZ5kDmSTuKJMM0ElatCDFRf7Wg0PeCj
         +1sO4j1WRwDf4zo1Ui98zCnqov7ixlhqKQLwpwBG6dUc7YceqJ+BfrGzT+ta9sq2qVLV
         JRbkT5KQ+yhSs8iWfduTx1G1rxKu29BqvhwI/AilZuoDhvJWYT3L5oDvNqpEblcspK4z
         5E2OuNyiliTOOWn2n1Lg+BSBUsCLL2tdw0rFRNPW4HZ52C8dZ44fFggtAw2mSvP5nJeL
         xqTD0wQbktuBsq2gwtxjHPdJOIh+Ie9aaoPKy4sVjj/+qQyuinwVT7zoe4x4hvyeDROG
         er2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621396; x=1773226196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i1z581a3c8Mz/0odpr2PMYfWS45knctiwr4B1Quq3vY=;
        b=XwC7iITnVtndhcPXv4b9cg0/l7bUCY+WygHOQ2O1jchGjMsKC+GyN5hsGYtqGSLkPf
         en5AWHPYQwQSeLVwE5CwPMYm9TNhA2m0hNk5JDCzw4ElaZrYjIR0KIWyBN5sY7ggZaZ7
         AGQcTK+NJ77fAVjjgB6Dn3sdf7paVdFTDwB2Kreu3iU9ZUimtWX3veNnaR8V0omscphM
         k/G1Nd9DbHGsxI+H0axU3kCyT06FBPvyO53xVUXdbjFzMrTRWzKTzS4XPcezXF1WniEi
         4O37VMqJIG8sf2wTaNt5qchhDz5UujvWyuGbQkAsBoOpyxZ318hLSQAka2ORjnKb8rsM
         LB6w==
X-Forwarded-Encrypted: i=1; AJvYcCVGS+q/EXoulDILYVW6QaAAgWAXbcDGoy1YghWbnz56Tc/6TVRZTXsi7fQa4qHiYesEFo25zKaDeZ7h@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkrWKw7OEug4Q65doxeh0OXCo1lkI84B4C1Cv+gplKFwQx81Q
	EjO4A13ZQI2QPkiVcNAfYyzMWFv5M7mbhYSvPzKFGQdBxvFZ86FHWKXY
X-Gm-Gg: ATEYQzysRTtytB+xGuO7ZVrbOjq/j3+sNW3e09Wx/Ur8M4bA/1QcsEcMj+c01/Ly8wT
	YBPWPV4qI/qrFXjmlLCB3ZjYa+2oM20MkrYvnMVbrC5ybOZl2DHBktblyUIsYIozXnfnLn3l07z
	KejL9Wul0v1wXqpvElh5lEs9u9VD8M/wh8xqtWPu9pzcEIpw4Cam3t08w7NAwDfKMnbr0a3jWHA
	qXXAQ70sgFrE/ZAiwLd9Ps/T6eeDch5sUQ0YhsLpM03UY+K0I0Y+cdp00blhxmhweyMdDcdDUL5
	eCNvySOJHsAi0orHXdG6L3OWA3mF5Jh6JPUhR6eyVgZb7uP8f0PqAG45V+HrdpELPUbFSDBHmZM
	C5nARzSRoDXk6xyMC38JXfvzpI3cg3LwrlXvTPKKpVy2k5NwCovEdJvITYMEcnV6Tr52YjcsxuG
	/j7Dm6DgugawmNMRh/+KZa/IICluW1oD6nmJL9yzjRXE8uD3MX7Qz/xQ==
X-Received: by 2002:a17:903:9ce:b0:2ae:5464:7a4b with SMTP id d9443c01a7336-2ae6aa09375mr15141185ad.14.1772621396516;
        Wed, 04 Mar 2026 02:49:56 -0800 (PST)
Received: from openwrt-virtual-machine ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6c4dd0sm195243265ad.70.2026.03.04.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:49:56 -0800 (PST)
Date: Wed, 4 Mar 2026 21:49:48 +1100
From: Bevan Weiss <bevan.weiss@gmail.com>
To: lee@kernel.org, pavel@kernel.org, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] leds/build: allow tristate for leds-syscon
Message-ID: <20260304214948.406cd872@openwrt-virtual-machine>
In-Reply-To: <20260302062646.938576-1-bevan.weiss@gmail.com>
References: <20260302062646.938576-1-bevan.weiss@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C8731FE8C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7080-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon,  2 Mar 2026 17:26:45 +1100
Bevan Weiss <bevan.weiss@gmail.com> wrote:

> My first submission to a linux-kernel list, so apologies for any
> errors.

Sorry all, please ignore this patch.
I'll review, and send a V2 once I sort out some of the issues here. 


Regards,
Bevan Weiss

