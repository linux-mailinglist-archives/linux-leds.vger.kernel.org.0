Return-Path: <linux-leds+bounces-6675-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD896D3AD39
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 15:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 719873027A5E
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0829536C5AD;
	Mon, 19 Jan 2026 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEnNXf/D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF02309B9;
	Mon, 19 Jan 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834275; cv=none; b=lpFo8hLypHNkuX3km0NH9pVoqh0JW6zOMButQbjx0m1aapmR8bELoeG9zjmaHcRUGOKrC1QKwNp23QQZX3cCiOLE0CAa3M3GqkZEkv3+mgMF9h6guf0OXQaqypQmVMWudABl/u99rSxqB0bhMu435onpN6zvav0KltcDYwH9D9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834275; c=relaxed/simple;
	bh=ySj2aNj606iYqabEio6O5eCs4M+kihBYdkQ8NbRj6UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujKgbqdqxnsI2mu01INip7eL0CdrM7dI8aZhphOIXdyPiBRVmV/9q3MnKzFfkb29gZlUJRKAcvTiyhyOuLWidoXOyxq0NAR57GvE8I9BbpyLW9oYPwUeeaeNCgrLK9WEOTmBv60X10hYjTelE3zB9MsiMN2CXeS9o9e4hTbw6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEnNXf/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92705C116C6;
	Mon, 19 Jan 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834275;
	bh=ySj2aNj606iYqabEio6O5eCs4M+kihBYdkQ8NbRj6UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEnNXf/DgIKOnD1rH3kHDLyzQbWdk9u6MUWFQ9Y4Hkmg5KtYfkUXJA5BBZd5eBF+f
	 /nu9BHCrtZGPIDWhN+NKiiABtRhm7HgwURNrTzGxS70gcVyFEe25o9U2+onN281zM4
	 VVTmuSgSN0kPDPFcULEbAH0nbzOQDo4Fa20u1jQjQmkO5zcd1jC9eJclxaGQ/8nW2h
	 0lxUZ6inAkA8pWJ94jRqx5mmfdyxS0BAq/GGESj+WLfDPpddoVmJ1cPDmvxlcQMsSG
	 EoJHLco+IlaOjPbpj0w9aA3wgg12d/+diocyvDrT3xAVYX8CyDbbf7wX1hL0Ke9iKT
	 2068lGV+3sT9g==
Date: Mon, 19 Jan 2026 14:51:08 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Gianluca Boiano <morf3089@gmail.com>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Message-ID: <aW5E3HuAoCAC-APx@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-2-e6c93de84079@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-2-e6c93de84079@mainlining.org>

On Fri, Jan 16, 2026 at 08:07:34AM +0100, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
>
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel

